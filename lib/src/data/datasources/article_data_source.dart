import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/common/exception.dart';
import 'package:interpretasi/src/data/models/article_detail_model.dart';
import 'package:interpretasi/src/data/models/article_detail_response.dart';
import 'package:interpretasi/src/data/models/article_model.dart';
import 'package:interpretasi/src/data/models/article_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ArticleDataSource {
  Future<List<ArticleModel>> getLatestArticle();
  Future<ArticleDetailModel> getArticleDetail(String id);
  Future<bool> deleteArticle(String id);
  Future<bool> createArticle({
    required int categoryId,
    required File image,
    required String title,
    required String content,
    required String deltaJson,
    required List<String> tags,
  });
  Future<bool> updateArticle({
    required String id,
    required String title,
    required String content,
    required File? imageFile,
    required List<String> categories,
  });
}

class ArticleDataSourceImpl extends ArticleDataSource {
  ArticleDataSourceImpl(this.client);
  final http.Client client;

  @override
  Future<List<ArticleModel>> getLatestArticle() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(Const.token);
    final header = {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };

    final url = Uri(
      scheme: Const.scheme,
      host: Const.host,
      path: '/v1/article/',
    );

    final response = await client.get(url, headers: header);
    if (response.statusCode == 200) {
      return ArticleResponse.fromJson(
        json.decode(response.body) as Map<String, dynamic>,
      ).articleList;
    } else {
      throw ServerException(ExceptionMessage.internetNotConnected);
    }
  }

  @override
  Future<ArticleDetailModel> getArticleDetail(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(Const.token);
    final header = {
      'Authorization': 'Bearer $token',
    };
    final url = Uri(
      scheme: Const.scheme,
      host: Const.host,
      path: '/v1/article/$id',
    );
    final response = await client.get(url, headers: header);
    if (response.statusCode == 200) {
      return ArticleDetailResponse.fromJson(
        json.decode(response.body) as Map<String, dynamic>,
      ).article;
    } else {
      throw ServerException(ExceptionMessage.internetNotConnected);
    }
  }

  @override
  Future<bool> createArticle({
    required int categoryId,
    required File image,
    required String title,
    required String content,
    required String deltaJson,
    required List<String> tags,
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
      path: '/v1/article',
    );

    final request = http.MultipartRequest(
      'POST',
      url,
    );
    request.fields['category_id'] = categoryId.toString();
    request.fields['title'] = title;
    request.fields['content'] = content;
    request.fields['original_content'] = deltaJson;
    request.fields['tags'] = tags.map((e) => '"$e"').toList().toString();
    final storeImage = await http.MultipartFile.fromPath(
      'image',
      image.path,
    );

    request.headers.addAll(header);
    request.files.add(storeImage);
    final response = await request.send();
    if (response.statusCode == 200) {
      return true;
    } else {
      throw ServerException(ExceptionMessage.internetNotConnected);
    }
  }

  @override
  Future<bool> updateArticle({
    required String id,
    required String title,
    required String content,
    required File? imageFile,
    required List<String> categories,
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
      path: '/v1/article/$id',
    );

    final request = http.MultipartRequest(
      'POST',
      url,
    );

    request.fields['_method'] = 'PUT';
    request.fields['title'] = title;
    request.fields['content'] = content;
    request.fields['categories'] = categories
        .map((e) {
          return e;
        })
        .toList()
        .toString();

    if (imageFile != null) {
      final storeImage = await http.MultipartFile.fromPath(
        'image',
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
  Future<bool> deleteArticle(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(Const.token);
    final header = {
      'Authorization': 'Bearer $token',
    };

    final url = Uri(
      scheme: Const.scheme,
      host: Const.host,
      path: '/v1/article/$id',
    );

    final response = await client.delete(url, headers: header);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw ServerException(ExceptionMessage.internetNotConnected);
    }
  }
}
