import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/common/exception.dart';
import 'package:interpretasi/src/data/models/user_model.dart';
import 'package:interpretasi/src/data/models/user_response.dart';
import 'package:interpretasi/src/data/models/verification_status_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserDataSource {
  Future<VerificationStatusModel> checkUserVerification();
  Future<UserModel> getProfile();
  Future<bool> changeProfile({
    required String name,
    required String bio,
    required File? imageFile,
  });
}

@Injectable(as: UserDataSource)
class UserDataSourceImpl extends UserDataSource {
  UserDataSourceImpl(this.client);
  final http.Client client;

  @override
  Future<VerificationStatusModel> checkUserVerification() async {
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
      return VerificationStatusModel.fromJson(
        json.decode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw ServerException(ExceptionMessage.internetNotConnected);
    }
  }

  @override
  Future<bool> changeProfile({
    required String name,
    required String bio,
    required File? imageFile,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(Const.token);
    final header = {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };

    final url = Uri(
      scheme: Const.scheme,
      host: Const.host,
      path: '/v1/user/profile/update',
    );

    final request = http.MultipartRequest(
      'POST',
      url,
    );
    request.fields['name'] = name;
    request.fields['bio'] = bio;

    if (imageFile != null) {
      final storeImage = await http.MultipartFile.fromPath(
        'photo',
        imageFile.path,
      );
      request.files.add(storeImage);
    }
    request.headers.addAll(header);
    final response = await request.send();
    if (response.statusCode == 200) {
      return true;
    } else {
      throw ServerException(ExceptionMessage.internetNotConnected);
    }
  }

  @override
  Future<UserModel> getProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(Const.token);
    final header = {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };

    final url = Uri(
      scheme: Const.scheme,
      host: Const.host,
      path: '/v1/user/profile',
    );

    final response = await http.get(url, headers: header);
    if (response.statusCode == 200) {
      return UserResponse.fromJson(
        json.decode(response.body) as Map<String, dynamic>,
      ).user;
    } else if (response.statusCode == 401) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(Const.token);
      throw ServerException(ExceptionMessage.internetNotConnected);
    } else {
      throw ServerException(ExceptionMessage.internetNotConnected);
    }
  }
}
