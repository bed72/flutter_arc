import 'package:seller/src/domain/params/http/http_params.dart';
import 'package:seller/src/domain/params/path/path_params.dart';

class HttpParamsMock extends HttpParams {
  HttpParamsMock({
    PathParam url = PathParam.signUp,
    String name = 'Bed',
    String email = 'email@email.com',
    String password = 'use_secure_password',
  }) : super(
          url: PathParam.signUp,
          body: {
            'name': name,
            'email': email,
            'password': password,
          },
          header: {
            'accept': 'application/json',
            'content-type': 'application/json',
          },
        );
}
