import 'package:mocktail/mocktail.dart';

import 'package:seller/src/external/adapters/http/http_adapter.dart';

class SignUpUseCaseSpy extends Mock implements HttpAdapter {
  When signUp() => when(() => post(params: any(named: 'params')));
  void error(HttpType value) => signUp().thenAnswer((_) async => value);
  void success(HttpType value) => signUp().thenAnswer((_) async => value);
}
