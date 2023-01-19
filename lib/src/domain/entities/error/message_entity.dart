import 'package:seller/src/domain/entities/response_entity.dart';

class MessageEntity extends BaseEntity {
  final String message;

  MessageEntity({required this.message});

  factory MessageEntity.fromJson(Map<String, dynamic> json) => MessageEntity(
        message: json['message'] as String,
      );
}
