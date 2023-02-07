import 'package:equatable/equatable.dart';

class Author extends Equatable {
  const Author({
    required this.name,
    required this.photo,
  });

  final String name;
  final String photo;

  @override
  List<Object?> get props => [name, photo];
}
