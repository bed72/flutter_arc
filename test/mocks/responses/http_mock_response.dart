import 'dart:io';

import 'package:either_dart/either.dart';

import 'package:seller/src/external/adapters/http/http_adapter.dart';

class HttpSignUpResponseMock {
  static HttpType success() => const Right({
        'status': HttpStatus.ok,
        'data': {
          'access_token': 'tP8azno3Blwfgownx6pt...',
          'refresh_token': 'tP8azno3Blwfgownx6pt...'
        }
      });

  static HttpType error() => const Left({
        'status': HttpStatus.badRequest,
        'data': {'message': 'Este e-mail já foi cadastrado!'}
      });
}
