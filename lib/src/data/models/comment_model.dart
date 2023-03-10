import 'package:equatable/equatable.dart';
import 'package:interpretasi/src/data/models/user_comment_model.dart';
import 'package:interpretasi/src/domain/entities/comment.dart';

class CommentModel extends Equatable {
  const CommentModel({
    required this.id,
    required this.body,
    required this.createdAt,
    required this.user,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'] as int,
      body: json['body'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      user: UserCommentModel.fromJson(json['user'] as Map<String, dynamic>),
    );
  }

  final int id;
  final String body;
  final DateTime createdAt;
  final UserCommentModel user;

  Comment toEntity() {
    return Comment(
      id: id,
      body: body,
      createdAt: createdAt,
      user: user.toEntity(),
    );
  }

  @override
  List<Object?> get props => [
        id,
        body,
        createdAt,
        user,
      ];
}
