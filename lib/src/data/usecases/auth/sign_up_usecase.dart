import 'package:either_dart/either.dart';

import 'package:seller/src/data/models/response_model.dart';
import 'package:seller/src/data/params/http/http_params.dart';
import 'package:seller/src/data/models/auth/sign_up_model.dart';
import 'package:seller/src/data/models/error/message_model.dart';

import 'package:seller/src/external/adapters/http/http_adapter.dart';

typedef SingUpType
    = Either<ResponseModel<MessageModel>, ResponseModel<SignUpModel>>;

abstract class SignUpUseCase {
  Future<SingUpType> call({required HttpParams params});
}

class SignUpUseCaseImpl extends SignUpUseCase {
  late final HttpAdapter _client;

  SignUpUseCaseImpl({required client}) : _client = client;

  @override
  Future<SingUpType> call({required HttpParams params}) async {
    final response = await _client.post(params: params);

    return response.either(
      (left) => ResponseModel<MessageModel>.fromJson(left),
      (right) => ResponseModel<SignUpModel>.fromJson(right),
    );
  }
}
