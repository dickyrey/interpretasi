import 'package:equatable/equatable.dart';

class UrlImageModel extends Equatable{
  const UrlImageModel({
    required this.url,
  });

  factory UrlImageModel.fromJson(Map<String, dynamic> json) {
    return UrlImageModel(
      url: json['url'] as String,
    );
  }

  final String url;
  
  @override
  List<Object?> get props => [url];
}
