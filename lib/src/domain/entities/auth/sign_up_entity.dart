import 'package:seller/src/domain/entities/response_entity.dart';

class SignUpEntity extends BaseEntity {
  final String accessToken;
  final String refreshToken;

  SignUpEntity({
    required this.accessToken,
    required this.refreshToken,
  });

  factory SignUpEntity.fromMap(Map<String, dynamic> json) => SignUpEntity(
        accessToken: json['access_token'] as String,
        refreshToken: json['refresh_token'] as String,
      );
}
