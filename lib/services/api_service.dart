import 'dart:io';

import 'package:dio/dio.dart';

import '../utils/helpers/shared.dart';

class ApiService {
  static BaseOptions options = BaseOptions(
    baseUrl: apiConstants.apiUrl,
  );
  Dio dio = Dio(options);

  Future getData(String data) async {
    final result =
        await dio.get(apiConstants.shorten, queryParameters: {'url': data});

    if (result.statusCode == HttpStatus.ok ||
        result.statusCode == HttpStatus.created) {
      return result.data;
    } else {
      return result.statusMessage;
    }
  }
}
