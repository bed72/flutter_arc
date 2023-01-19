import 'package:seller/src/domain/params/auth/sign_up_params.dart';

class SignUpParamsMock extends SignUpParams {
  SignUpParamsMock({
    String name = 'Bed',
    String email = 'email@email.com',
    String password = 'use_secure_password',
  }) : super(
          name: name,
          email: email,
          password: password,
        );
}
