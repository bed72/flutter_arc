import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';

import 'package:seller/src/external/adapters/http/http_adapter.dart';

import 'package:seller/src/domain/usecases/auth/sign_up_usecase.dart';

import 'package:seller/src/presentation/screens/auth/signup/cubit/signup_cubit.dart';

abstract class LocatorAdapter {
  Future<void> initialized();
}

class LocatorAdapterImpl implements LocatorAdapter {
  final GetIt _loc;
  final _options = BaseOptions(
    baseUrl: 'http://192.168.1.8:3000',
    responseType: ResponseType.json,
  );

  LocatorAdapterImpl({required GetIt locator}) : _loc = locator;

  @override
  Future<void> initialized() async {
    // Dio
    _loc.registerSingleton<Dio>(Dio(_options));

    // Adapters
    _loc.registerLazySingleton<HttpAdapter>(
      () => HttpAdapterImpl(http: _loc.get<Dio>()),
    );

    // UseCases
    _loc.registerLazySingleton<SignUpUseCase>(
      () => SignUpUseCaseImpl(client: _loc.get<HttpAdapter>()),
    );

    // Blocs
    _loc.registerFactory<SignUpCubit>(
      () => SignUpCubit(_loc.get<SignUpUseCase>()),
    );
  }
}
