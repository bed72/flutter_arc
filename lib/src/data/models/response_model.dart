import 'package:seller/src/data/models/auth/sign_up_model.dart';
import 'package:seller/src/data/models/error/message_model.dart';

abstract class BaseModel {}

class ResponseModel<T extends BaseModel> {
  final int status;
  final T data;

  const ResponseModel({
    required this.status,
    required this.data,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel<T>(
        status: json['status'] as int,
        data: _getProperDataValue(json['data']),
      );

  static T _getProperDataValue<T extends BaseModel>(Map<String, dynamic> json) {
    switch (T) {
      case SignUpModel:
        return SignUpModel.fromMap(json) as T;
      case MessageModel:
        return MessageModel.fromJson(json) as T;
      default:
        return MessageModel.fromJson(
          {
            'message': 'Um erro inesperado aconteceu, tente mais tarde!',
          },
        ) as T;
    }
  }
}
