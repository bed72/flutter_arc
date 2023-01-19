import 'package:bloc/bloc.dart';

import 'package:flutter/foundation.dart';

import 'package:seller/src/domain/params/http/http_params.dart';
import 'package:seller/src/domain/params/path/path_params.dart';
import 'package:seller/src/domain/params/auth/sign_up_params.dart';

import 'package:seller/src/domain/entities/auth/sign_up_entity.dart';
import 'package:seller/src/domain/entities/error/message_entity.dart';

import 'package:seller/src/domain/usecases/auth/sign_up_usecase.dart';

part 'signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  late final SignUpUseCase _useCase;

  SignUpCubit(this._useCase) : super(SignupInitialState());

  Future<void> signUp(SignUpParams params) async {
    emit(SignUpLoadingState());

    final response = await _useCase(params: _buildParams(params));

    response.fold(
      (left) => emit(SignUpErrorState(left.data)),
      (right) => emit(SignUpSuccessState(right.data)),
    );
  }

  HttpParams _buildParams(SignUpParams params) => HttpParams(
        url: PathParam.signUp,
        body: SignUpParams(
          name: params.name,
          email: params.email,
          password: params.password,
        ).toMap(),
      );
}
