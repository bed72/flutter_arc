import 'package:either_dart/either.dart';

import 'package:seller/src/external/adapters/http/http_adapter.dart';

import 'package:seller/src/domain/params/http/http_params.dart';
import 'package:seller/src/domain/entities/response_entity.dart';
import 'package:seller/src/domain/entities/auth/sign_up_entity.dart';
import 'package:seller/src/domain/entities/error/message_entity.dart';

typedef SingUpType
    = Either<ResponseEntity<MessageEntity>, ResponseEntity<SignUpEntity>>;

abstract class SignUpUseCase {
  Future<SingUpType> call({required HttpParams params});
}

class SignUpUseCaseImpl extends SignUpUseCase {
  late final HttpAdapter _client;

  SignUpUseCaseImpl({required client}) : _client = client;

  @override
  Future<SingUpType> call({required HttpParams params}) async {
    final reponse = await _client.post(params: params);

    return reponse.either(
      (left) => ResponseEntity<MessageEntity>.fromJson(left),
      (right) => ResponseEntity<SignUpEntity>.fromJson(right),
    );
  }
}
