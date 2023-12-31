// ignore_for_file: deprecated_member_use, avoid_print, unused_element

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../core/api_endpoints.dart';
import '../../core/types.dart';

class Request {
  Dio _dio = Dio();
  final box = GetStorage();

  Request() {
    _dio = Dio(BaseOptions(
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
        persistentConnection: true,
        receiveDataWhenStatusError: true,
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        sendTimeout: const Duration(seconds: 60),
        contentType: "application/json",
        responseType: ResponseType.json));

    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      // responseHeader: true,
      maxWidth: 95,
    ));
  }

  Future<void> _getToken() async {
    var getToken = await box.read("token");
    updateAuthorization(getToken);
  }

  /// Fungsi ini digunakan untuk memperbarui header authorization
  void updateAuthorization(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  /// GET request
  Future<Response> get(String endpoint,
      {JSON? queryParameters, bool requiresAuthToken = true}) async {
    if (requiresAuthToken) await _getToken();
    return await _dio.get(endpoint, queryParameters: queryParameters);
  }

  /// POST request
  Future<Response> post(String endpoint,
      {Object? body,
      JSON? queryParameters,
      required bool requiresAuthToken}) async {
    if (requiresAuthToken) await _getToken();
    return await _dio.post(endpoint,
        queryParameters: queryParameters, data: body);
  }

  /// DELETE request
  Future<Response> delete(String endpoint,
      {Object? body, required bool requiresAuthToken}) async {
    if (requiresAuthToken) await _getToken();
    return await _dio.delete(endpoint, data: body);
  }

  /// PUT request
  Future<Response> put(String endpoint,
      {Object? body,
      JSON? queryParameters,
      required bool requiresAuthToken}) async {
    if (requiresAuthToken) await _getToken();
    return await _dio.put(endpoint,
        data: body, queryParameters: queryParameters);
  }
}
