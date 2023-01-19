import 'package:mocktail/mocktail.dart';

import 'package:bloc_test/bloc_test.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:seller/src/external/adapters/http/http_adapter.dart';
import 'package:seller/src/domain/usecases/auth/sign_up_usecase.dart';

import 'package:seller/src/presentation/screens/auth/signup/cubit/signup_cubit.dart';

import '../../../spies/auth/sign_up_usecase_spy.dart';

import '../../../mocks/params/http_params_mock.dart';
import '../../../mocks/params/sign_up_params_mock.dart';
import '../../../mocks/responses/http_mock_response.dart';

void main() {
  late final HttpType result;
  late final SignUpUseCase useCase;

  setUpAll(() {
    registerFallbackValue(HttpParamsMock());
  });

  group('Should call SignUpCubit with correct values', () {
    blocTest<SignUpCubit, SignUpState>(
      'Should issue loading event and after success',
      setUp: () {
        result = HttpSignUpResponseMock.success();
        useCase = SignUpUseCaseImpl(
          client: SignUpUseCaseSpy()..success(result),
        );
      },
      build: () => SignUpCubit(useCase),
      act: (SignUpCubit cubit) => cubit.signUp(SignUpParamsMock()),
      expect: () => [
        isA<SignUpLoadingState>(),
        isA<SignUpSuccessState>(),
      ],
    );

    blocTest<SignUpCubit, SignUpState>(
      'Should issue loading event and after error',
      setUp: () {
        result = HttpSignUpResponseMock.error();
        useCase = SignUpUseCaseImpl(
          client: SignUpUseCaseSpy()..error(result),
        );
      },
      build: () => SignUpCubit(useCase),
      act: (SignUpCubit cubit) => cubit.signUp(SignUpParamsMock()),
      expect: () => [
        isA<SignUpLoadingState>(),
        isA<SignUpErrorState>(),
      ],
    );
  });
}
