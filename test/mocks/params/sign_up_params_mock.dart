import 'package:seller/src/data/models/auth/sign_up_params_model.dart';

class SignUpParamsModelMock extends SignUpParamsModel {
  SignUpParamsModelMock({
    String name = 'Bed',
    String email = 'email@email.com',
    String password = 'use_secure_password',
  }) : super(
          name: name,
          email: email,
          password: password,
        );
}
