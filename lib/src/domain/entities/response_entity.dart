import 'package:seller/src/domain/entities/auth/sign_up_entity.dart';
import 'package:seller/src/domain/entities/error/message_entity.dart';

abstract class BaseEntity {}

class ResponseEntity<T extends BaseEntity> {
  final int status;
  final T data;

  const ResponseEntity({
    required this.status,
    required this.data,
  });

  factory ResponseEntity.fromJson(Map<String, dynamic> json) =>
      ResponseEntity<T>(
        status: json['status'] as int,
        data: _getProperDataValue(json['data']),
      );

  static T _getProperDataValue<T extends BaseEntity>(
      Map<String, dynamic> json) {
    switch (T) {
      case SignUpEntity:
        return SignUpEntity.fromMap(json) as T;
      case MessageEntity:
        return MessageEntity.fromJson(json) as T;
      default:
        return MessageEntity.fromJson(
          {
            'message': 'Um erro inesperado aconteceu, tente mais tarde!',
          },
        ) as T;
    }
  }
}
