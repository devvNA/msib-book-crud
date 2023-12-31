import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:km_book_crud/app/core/api_endpoints.dart';
import 'package:km_book_crud/app/data/models/user_model.dart';
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
      // final errorRes = e.response;
      // String message = errorRes?.data['message']; // ambil pesan error
      // box.write("errMsg", message);
      // log(message);
      return false;
    }
  }

  Future<bool> logout() async {
    try {
      final request = Request();

      var response = await request.delete(
        logoutUrl,
        requiresAuthToken: true,
      );
      if (response.statusCode == 200) {
        box.remove("token");
        log("Token : ${box.read("token")}");
        return true;
      }
      return false;
    } on DioException catch (_) {
      return false;
    }
  }

  Future<bool> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      final request = Request();

      var response =
          await request.post(registerUrl, requiresAuthToken: false, body: {
        "name": name,
        "email": email,
        "password": password,
        "password_confirmation": passwordConfirmation,
      });

      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } on DioException catch (_) {
      return false;
    }
  }

  Future<User> getUser() async {
    try {
      final request = Request();

      var response = await request.get(userUrl, requiresAuthToken: true);
      User? user;
      if (response.statusCode == 200) {
        user = User.fromJson(response.data);
        return user;
      }
      return user!;
    } on DioException catch (_) {
      rethrow;
    }
  }
}
