import 'package:flutter/foundation.dart';

import 'package:seller/src/data/models/auth/sign_up_model.dart';
import 'package:seller/src/data/models/auth/sign_up_params_model.dart';
import 'package:seller/src/data/models/error/message_model.dart';
import 'package:seller/src/data/params/http/http_params.dart';
import 'package:seller/src/data/params/path/path_params.dart';
import 'package:seller/src/data/usecases/auth/sign_up_usecase.dart';

part 'signup_state.dart';

// class SignUpCubit extends Cubit<SignUpState> {
//   late final SignUpUseCase _useCase;

//   SignUpCubit(this._useCase) : super(SignupInitialState());

// Future<void> signUp(SignUpParamsModel params) async {
//   emit(SignUpLoadingState());

//   final response = await _useCase(params: _buildParams(params));

//   response.fold(
//     (left) => emit(SignUpErrorState(left.data)),
//     (right) => emit(SignUpSuccessState(right.data)),
//   );
// }

// HttpParams _buildParams(SignUpParamsModel params) => HttpParams(
//       url: PathParam.signUp,
//       body: SignUpParamsModel(
//         name: params.name,
//         email: params.email,
//         password: params.password,
//       ).toMap(),
//     );
// }

class SignUpCubit extends ValueNotifier<SignUpState> {
  late final SignUpUseCase _useCase;

  SignUpCubit(this._useCase) : super(SignupInitialState());

  Future<void> signUp(SignUpParamsModel params) async {
    _emit(SignUpLoadingState());

    final response = await _useCase(params: _buildParams(params));

    response.fold(
      (left) => _emit(SignUpErrorState(left.data)),
      (right) => _emit(SignUpSuccessState(right.data)),
    );
  }

  void _emit(SignUpState satate) {
    value = satate;
  }

  HttpParams _buildParams(SignUpParamsModel params) => HttpParams(
        url: PathParam.signUp,
        body: SignUpParamsModel(
          name: params.name,
          email: params.email,
          password: params.password,
        ).toMap(),
      );
}
