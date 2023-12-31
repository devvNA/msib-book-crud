import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:km_book_crud/app/core/api_endpoints.dart';
import '../services/network_services.dart';

class AuthRepository {
  final box = GetStorage();

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      final request = Request();

      final response = await request.post(
        loginUrl,
        requiresAuthToken: false,
        body: {
          "email": email,
          "password": password,
        },
      );

      if (response.statusCode == 200) {
        box.write("token", response.data["token"]);
        log("Token : ${box.read("token")}");
        return true;
      }
      return false;
    } on DioException catch (_) {
      return false;
    }
  }
}
