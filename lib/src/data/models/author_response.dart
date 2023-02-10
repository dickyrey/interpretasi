import 'package:equatable/equatable.dart';
import 'package:interpretasi/src/data/models/author_model.dart';

class AuthorResponse extends Equatable {
  const AuthorResponse({
    required this.author,
  });

  factory AuthorResponse.fromJson(Map<String, dynamic> json) {
    return AuthorResponse(
      author: AuthorModel.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final AuthorModel author;

  @override
  List<Object?> get props => [author];
}
