import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:either_dart/either.dart';

import 'package:seller/src/data/params/http/http_params.dart';

typedef HttpType = Either<Map<String, dynamic>, Map<String, dynamic>>;

abstract class HttpAdapter {
  Future<HttpType> post({required HttpParams params});
}

class HttpAdapterImpl implements HttpAdapter {
  late final Dio _http;

  HttpAdapterImpl({required Dio http}) : _http = http;

  @override
  Future<HttpType> post({required HttpParams params}) async {
    try {
      final response = await _http.post(
        params.url.value,
        data: jsonEncode(params.body),
      );

      return Right(response.data);
    } on DioError catch (error) {
      return Left(error.response?.data);
    }
  }
}
