import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/common/exception.dart';
import 'package:interpretasi/src/data/models/token_model.dart';
import 'package:interpretasi/src/data/models/verification_status_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthDataSource {
  Future<bool> checkGoogleAuth();
  Future<void> signInWithGoogle();
  Future<bool> signInWithEmail({
    required String email,
    required String password,
  });
  Future<bool> signUpWithEmail(String email);
  Future<void> signOut();
  Future<List<String>> getTimeZone();
  Future<bool> resendEmailVerification();
}

@Injectable(as: AuthDataSource)
class AuthDataSourceImpl extends AuthDataSource {
  AuthDataSourceImpl({
    required this.client,
    required this.googleSignIn,
  });

  final http.Client client;
  final GoogleSignIn googleSignIn;

  @override
  Future<bool> checkGoogleAuth() async {
    final isSignedIn = await googleSignIn.isSignedIn();
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(Const.token);

    final header = {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };
    final url = Uri(
      scheme: Const.scheme,
      host: Const.host,
      path: '/v1/user/check',
    );
    final response = await client.get(url, headers: header);
    if (response.statusCode == 200) {
      final status = VerificationStatusModel.fromJson(
        json.decode(response.body) as Map<String, dynamic>,
      );
      if (isSignedIn && token != null) {
        return true;
      } else if (token != null &&
          status.isEmailVerified == true &&
          status.isSetPassword == true) {
        return true;
      } else {
        await prefs.remove(Const.token);
        return false;
      }
    } else if (response.statusCode == 401) {
      throw ServerException(ExceptionMessage.notAuthenticated);
    } else {
      await prefs.remove(Const.token);
      throw ServerException(ExceptionMessage.internetNotConnected);
    }
  }

  @override
  Future<void> signInWithGoogle() async {
    final prefs = await SharedPreferences.getInstance();

    final time = await getTimeZone();

    String generateSHA256(String data) {
      final bytes = utf8.encode(data);
      final hash = sha256.convert(bytes);
      return hash.toString();
    }

    try {
      final user = await googleSignIn.signIn();
      final url = Uri(
        scheme: Const.scheme,
        host: Const.host,
        path: '/v1/signin/google',
        queryParameters: {
          'email': user?.email,
          'displayName': user?.displayName,
          'photo': (user!.photoUrl == null) ? Const.photo : user.photoUrl,
          'token': generateSHA256(time.first),
        },
      );

      final response = await http.post(url);
      if (response.statusCode == 200) {
        final accessToken = TokenModel.fromJson(
          json.decode(response.body) as Map<String, dynamic>,
        );
        await prefs.setString(Const.token, accessToken.token);
        return;
      } else if (response.statusCode == 400) {
        await googleSignIn.signOut();
        throw ServerException(ExceptionMessage.invalidToken);
      } else if (response.statusCode == 407) {
        await googleSignIn.signOut();
        throw ServerException(ExceptionMessage.internetNotConnected);
      } else if (response.statusCode == 401) {
        throw ServerException(ExceptionMessage.notAuthenticated);
      } else {
        await googleSignIn.signOut();
        throw ServerException(ExceptionMessage.internetNotConnected);
      }
    } catch (error) {
      if (error is PlatformException) {
        if (error.code == 'SIGN_IN_CANCELLED') {
          await googleSignIn.signOut();
          throw ServerException(ExceptionMessage.signInCancelled);
        } else {
          await googleSignIn.signOut();
          throw ServerException(ExceptionMessage.internetNotConnected);
        }
      } else {
        await googleSignIn.signOut();
        throw ServerException(ExceptionMessage.invalidToken);
      }
    }
  }

  @override
  Future<bool> signInWithEmail({
    required String email,
    required String password,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    final headers = {
      'Accept': 'application/json',
    };
    final body = {
      'email': email,
      'password': password,
    };

    final url = Uri(
      scheme: Const.scheme,
      host: Const.host,
      path: '/v1/signin',
    );

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      final accessToken = TokenModel.fromJson(
        json.decode(response.body) as Map<String, dynamic>,
      );
      await prefs.setString(Const.token, accessToken.token);
      return true;
    } else if (response.statusCode == 401) {
      throw ServerException(ExceptionMessage.notAuthenticated);
    } else if (response.statusCode == 403) {
      throw ServerException(ExceptionMessage.wrongPassword);
    } else if (response.statusCode == 404) {
      throw ServerException(ExceptionMessage.userNotFound);
    } else {
      throw ServerException(ExceptionMessage.internetNotConnected);
    }
  }

  @override
  Future<bool> signUpWithEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();

    final body = {
      'email': email,
    };

    final url = Uri(
      scheme: Const.scheme,
      host: Const.host,
      path: '/v1/signup',
    );

    final response = await http.post(url, body: body);
    if (response.statusCode == 200) {
      final accessToken = TokenModel.fromJson(
        json.decode(response.body) as Map<String, dynamic>,
      );
      await prefs.setString(Const.token, accessToken.token);
      return true;
    } else if (response.statusCode == 400) {
      throw ServerException(ExceptionMessage.userAlreadyExist);
    } else if (response.statusCode == 401) {
      throw ServerException(ExceptionMessage.notAuthenticated);
    } else {
      throw ServerException(ExceptionMessage.internetNotConnected);
    }
  }

  @override
  Future<void> signOut() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(Const.token);
    final header = {
      'Authorization': 'Bearer $token',
    };

    final url = Uri(
      scheme: Const.scheme,
      host: Const.host,
      path: '/v1/signout',
    );

    final response = await http.post(url, headers: header);

    if (response.statusCode == 200) {
      await googleSignIn.signOut();
      await prefs.remove(Const.token);
      return;
    } else {
      await googleSignIn.signOut();
      await prefs.remove(Const.token);
      throw ServerException(ExceptionMessage.internetNotConnected);
    }
  }

  @override
  Future<List<String>> getTimeZone() async {
    final url = Uri(
      scheme: Const.scheme,
      host: Const.host,
      path: '/v1/datetime',
    );
    final response = await client.get(url);
    if (response.statusCode == 200) {
      List<String> timeZoneModelFromJson(String str) {
        final list = json.decode(str) as List;
        return List<String>.from(list.map((x) => x.toString()));
      }

      return timeZoneModelFromJson(response.body);
    } else {
      throw ServerException(ExceptionMessage.internetNotConnected);
    }
  }

  @override
  Future<bool> resendEmailVerification() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(Const.token);
    final header = {
      'Authorization': 'Bearer $token',
    };

    final url = Uri(
      scheme: Const.scheme,
      host: Const.host,
      path: '/v1/signup/resend',
    );

    final response = await http.post(url, headers: header);
    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 401) {
      throw ServerException(ExceptionMessage.notAuthenticated);
    } else {
      throw ServerException(ExceptionMessage.internetNotConnected);
    }
  }
}
