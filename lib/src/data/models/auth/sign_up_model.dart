import 'package:seller/src/data/models/response_model.dart';

class SignUpModel extends BaseModel {
  final String accessToken;
  final String refreshToken;

  SignUpModel({
    required this.accessToken,
    required this.refreshToken,
  });

  factory SignUpModel.fromMap(Map<String, dynamic> json) => SignUpModel(
        accessToken: json['access_token'] as String,
        refreshToken: json['refresh_token'] as String,
      );
}
