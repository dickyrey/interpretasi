import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/common/exception.dart';
import 'package:interpretasi/src/data/models/category_model.dart';
import 'package:interpretasi/src/data/models/category_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: one_member_abstracts
abstract class CategoryDataSource {
  Future<List<CategoryModel>> getCategories();
}

@Injectable(as: CategoryDataSource)
class CategoryDataSourceImpl extends CategoryDataSource {
  CategoryDataSourceImpl(this.client);

  final http.Client client;
  @override
  Future<List<CategoryModel>> getCategories() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(Const.token);
    final header = {
      'Authorization': 'Bearer $token',
    };

    final url = Uri(
      scheme: Const.scheme,
      host: Const.host,
      path: '/v1/article/',
      queryParameters: {'type': 'categories'},
    );

    final response = await http.get(url, headers: header);
    if (response.statusCode == 200) {
      return CategoryResponse.fromJson(
        json.decode(response.body) as Map<String, dynamic>,
      ).categoryList;
    } else if (response.statusCode == 401) {
      throw ServerException(ExceptionMessage.notAuthenticated);
    } else {
      throw ServerException(ExceptionMessage.internetNotConnected);
    }
  }
}
