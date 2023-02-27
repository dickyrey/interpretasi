import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/common/exception.dart';
import 'package:interpretasi/src/data/models/author_model.dart';
import 'package:interpretasi/src/data/models/author_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthorDataSource {
  Future<AuthorModel> getAuthor(int id);
  Future<bool> reportAuthor({required int id, required String reason});
}

@Injectable(as: AuthorDataSource)
class AuthorDataSourceImpl extends AuthorDataSource {
  AuthorDataSourceImpl(this.client);
  final http.Client client;

  @override
  Future<AuthorModel> getAuthor(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(Const.token);

    final header = {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };

    final url = Uri(
      scheme: Const.scheme,
      host: Const.host,
      path: '/v1/user/$id/show',
    );

    final response = await client.get(url, headers: header);

    if (response.statusCode == 200) {
      return AuthorResponse.fromJson(
        json.decode(response.body) as Map<String, dynamic>,
      ).author;
    } else {
      throw ServerException(ExceptionMessage.internetNotConnected);
    }
  }

  @override
  Future<bool> reportAuthor({required int id, required String reason}) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(Const.token);

    final header = {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };

    final body = {
      'reason': reason,
    };

    final url = Uri(
      scheme: Const.scheme,
      host: Const.host,
      path: '/v1/user/$id/report',
    );

    final response = await client.post(url, headers: header, body: body);
    
    if (response.statusCode == 200) {
      return true;
    } else {
      throw ServerException(ExceptionMessage.internetNotConnected);
    }
  }
}
