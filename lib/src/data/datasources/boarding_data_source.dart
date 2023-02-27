import 'dart:convert';

import 'package:flutter/services.dart' as root;
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:interpretasi/src/data/models/boarding_model.dart';
import 'package:interpretasi/src/data/models/boarding_response.dart';

// ignore: one_member_abstracts
abstract class BoardingDataSource {
  Future<List<BoardingModel>> getBoardingList();
}

@Injectable(as: BoardingDataSource)
class BoardingDataSourceImpl extends BoardingDataSource {
  BoardingDataSourceImpl(this.client);

  final http.Client client;
  @override
  Future<List<BoardingModel>> getBoardingList() async {
    // Load the JSON data from the mock_json/boarding.json file
    final jsonData = await root.rootBundle.loadString('jsons/boarding.json');

    // Decode the JSON data and convert it to a BoardingResponse object
    final response = BoardingResponse.fromJson(
      json.decode(jsonData) as Map<String, dynamic>,
    );

    // Return the list of categories from the response
    return response.boardingList;
  }
}
