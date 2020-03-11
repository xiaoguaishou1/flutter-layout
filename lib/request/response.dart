import 'dart:io';

import 'package:dio/dio.dart';

var dio = Dio(BaseOptions(
    baseUrl: "https://www.fastmock.site/mock/0dfb679390acd16d5f31e335d94f3733/panghu",
    connectTimeout: 5000,
    receiveTimeout: 100000,
    contentType: Headers.jsonContentType,
    // Transform the response data to a String encoded with UTF8.
    // The default value is [ResponseType.JSON].
    responseType: ResponseType.plain,
  ));