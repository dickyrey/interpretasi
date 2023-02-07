import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:interpretasi/src/domain/entities/author.dart';
import 'package:interpretasi/src/domain/entities/boarding.dart';

class AuthorModel extends Equatable {
  const AuthorModel({
    required this.name,
    required this.photo,
  });

  factory AuthorModel.fromJson(Map<String, dynamic> json) {
    return AuthorModel(
      name: json['name'] as String,
      photo: json['photo'] as String,
    );
  }

  final String name;
  final String photo;

  Author toEntity() {
    return Author(
      name: name,
      photo: photo,
    );
  }

  @override
  List<Object?> get props => [name, photo];
}

List<AuthorModel> authorModelFromJson(String str) {
  return List<AuthorModel>.from(
    (json.decode(str) as Iterable<dynamic>)
        .map((x) => AuthorModel.fromJson(x as Map<String, dynamic>)),
  );
}
