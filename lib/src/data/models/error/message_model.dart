import 'package:seller/src/data/models/response_model.dart';

class MessageModel extends BaseModel {
  final String message;

  MessageModel({required this.message});

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        message: json['message'] as String,
      );
}
