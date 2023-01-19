import 'package:seller/src/data/params/path/path_params.dart';

class HttpParams {
  final PathParam url;
  final Map<String, dynamic>? body;
  final Map<String, dynamic>? header;

  const HttpParams({
    this.body,
    this.header,
    required this.url,
  });
}
