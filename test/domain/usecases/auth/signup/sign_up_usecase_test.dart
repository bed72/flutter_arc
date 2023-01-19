import 'dart:io';

import 'package:mocktail/mocktail.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:seller/src/external/adapters/http/http_adapter.dart';

import 'package:seller/src/data/params/http/http_params.dart';
import 'package:seller/src/data/usecases/auth/sign_up_usecase.dart';

import 'package:seller/src/data/models/response_model.dart';
import 'package:seller/src/data/models/auth/sign_up_model.dart';
import 'package:seller/src/data/models/error/message_model.dart';

import '../../../../spies/auth/sign_up_usecase_spy.dart';

import '../../../../mocks/params/http_params_mock.dart';
import '../../../../mocks/responses/http_mock_response.dart';

void main() {
  late final HttpType result;
  late final HttpParams params;
  late final SignUpUseCase useCase;

  setUpAll(() {
    params = HttpParamsMock();

    registerFallbackValue(HttpParamsMock());
  });

  group('Should testing SignUp layer with JSON response success Right', () {
    setUp(() {
      result = HttpSignUpResponseMock.success();
      useCase = SignUpUseCaseImpl(client: SignUpUseCaseSpy()..success(result));
    });

    test('Should call SignUpUseCase with correct values', () async {
      final value = await useCase(params: params);

      expect(value.right, isA<ResponseModel<SignUpModel>>());
      expect(value.right.status, HttpStatus.ok);
      expect(value.right.data.accessToken.isNotEmpty, true);
      expect(value.right.data.refreshToken.isNotEmpty, true);
    });
  });

  group('Should testing SignUp layer with JSON response failure Left', () {
    setUp(() {
      result = HttpSignUpResponseMock.error();
      useCase = SignUpUseCaseImpl(client: SignUpUseCaseSpy()..error(result));
    });

    test('Should call SignUpUseCase with correct values', () async {
      final value = await useCase(params: params);

      expect(value.left, isA<ResponseModel<MessageModel>>());
      expect(value.left.status, HttpStatus.badRequest);
      expect(value.left.data.message.isNotEmpty, true);
    });
  });
}
