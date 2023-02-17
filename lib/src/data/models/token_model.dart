import 'package:equatable/equatable.dart';

class TokenModel extends Equatable{
  const TokenModel({
    required this.token,
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(
      token: json['data'] as String,
    );
  }

  final String token;
  
  @override
  List<Object?> get props => [token];
}
