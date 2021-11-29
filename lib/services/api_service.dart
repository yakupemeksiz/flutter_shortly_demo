import 'dart:io';

import 'package:dio/dio.dart';

import '../utils/helpers/shared.dart';

class ApiService {
  static final BaseOptions _options = BaseOptions(
    baseUrl: apiConstants.apiUrl,
    contentType: Headers.formUrlEncodedContentType,
  );
  Dio dio = Dio(_options);

  Future<dynamic> getData(String url) async {
    late final Response<dynamic> result;
    try {
      result = await dio.request(
        apiConstants.shorten,
        queryParameters: {'url': url},
        options: Options(method: 'GET'),
      );
      if (result.statusCode == HttpStatus.ok ||
          result.statusCode == HttpStatus.created) {
        return result.data;
      } else {
        return result.statusMessage;
      }
    } on DioError catch (e) {
      return e.type;
    }
  }
}
