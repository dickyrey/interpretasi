import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:interpretasi/src/domain/entities/boarding.dart';

class BoardingModel extends Equatable {
  const BoardingModel({
    required this.id,
    required this.image,
    required this.subtitle,
    required this.title,
  });

  factory BoardingModel.fromJson(Map<String, dynamic> json) {
    return BoardingModel(
      id: json['id'] as int,
      image: json['image'] as String,
      subtitle: json['subtitle'] as String,
      title: json['title'] as String,
    );
  }

  final int id;
  final String image;
  final String subtitle;
  final String title;

  Boarding toEntity() {
    return Boarding(
      id: id,
      image: image,
      subtitle: subtitle,
      title: title,
    );
  }

  @override
  List<Object?> get props => [
        id,
        image,
        subtitle,
        title,
      ];
}

List<BoardingModel> boardingModelFromJson(String str) {
  return List<BoardingModel>.from(
    (json.decode(str) as Iterable<dynamic>)
        .map((x) => BoardingModel.fromJson(x as Map<String, dynamic>)),
  );
}
