import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/common/exception.dart';
import 'package:interpretasi/src/data/models/comment_model.dart';
import 'package:interpretasi/src/data/models/comment_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CommentArticleDataSource {
  Future<List<CommentModel>> getCommentList(String id);
  Future<bool> sendComment({
    required String id,
    required String comment,
  });
  Future<bool> deleteComment({
    required String id,
    required int userId,
  });
  Future<bool> reportComment({
    required String articleId,
    required int commentId,
    required String reason,
  });
}

@Injectable(as: CommentArticleDataSource)
class CommentArticleDataSourceImpl extends CommentArticleDataSource {
  CommentArticleDataSourceImpl(this.client);
  final http.Client client;

  @override
  Future<bool> deleteComment({
    required String id,
    required int userId,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(Const.token);
    final header = {
      'Authorization': 'Bearer $token',
    };

    final url = Uri(
      scheme: Const.scheme,
      host: Const.host,
      path: '/v1/article/$id/comment/$userId',
    );

    final response = await client.delete(url, headers: header);

    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 401) {
      throw ServerException(ExceptionMessage.notAuthenticated);
    } else {
      throw ServerException(ExceptionMessage.internetNotConnected);
    }
  }

  @override
  Future<List<CommentModel>> getCommentList(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(Const.token);
    final header = {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };

    final url = Uri(
      scheme: Const.scheme,
      host: Const.host,
      path: '/v1/article/$id/comment',
    );

    final response = await client.get(url, headers: header);
    if (response.statusCode == 200) {
      return CommentResponse.fromJson(
        json.decode(response.body) as Map<String, dynamic>,
      ).commentList;
    } else if (response.statusCode == 401) {
      throw ServerException(ExceptionMessage.notAuthenticated);
    } else {
      throw ServerException(ExceptionMessage.internetNotConnected);
    }
  }

  @override
  Future<bool> sendComment({
    required String id,
    required String comment,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(Const.token);
    final header = {
      'Authorization': 'Bearer $token',
    };
    final body = {
      'body': comment,
    };

    final url = Uri(
      scheme: Const.scheme,
      host: Const.host,
      path: '/v1/article/$id/comment',
    );

    final response = await client.post(url, headers: header, body: body);

    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 401) {
      throw ServerException(ExceptionMessage.notAuthenticated);
    } else {
      throw ServerException(ExceptionMessage.internetNotConnected);
    }
  }

  @override
  Future<bool> reportComment({
    required String articleId,
    required int commentId,
    required String reason,
  }) async {
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
      path: '/v1/article/$articleId/comment/$commentId/report',
    );

    final response = await client.post(url, headers: header, body: body);

    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 401) {
      throw ServerException(ExceptionMessage.notAuthenticated);
    } else {
      throw ServerException(ExceptionMessage.internetNotConnected);
    }
  }
}
