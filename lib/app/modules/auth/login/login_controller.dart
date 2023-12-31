// ignore_for_file: unnecessary_overrides, unnecessary_null_comparison
import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:km_book_crud/app/data/repositories/auth_repository.dart';
import '../../../routes/home_routes.dart';

class LoginController extends GetxController {
  String? finalEmail;
  final box = GetStorage();
  final formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$');
  final isTap = false.obs;
  final visible = true.obs;
  final books = [].obs;

  @override
  void onInit() {
    getValidationData().whenComplete(() async {
      if (finalEmail != null) {
        await Future.delayed(const Duration(milliseconds: 1500));
        Get.offNamed(HomeRoutes.home);
        isTap.value = false;
      }
      isTap.value = false;
    });
    super.onInit();
  }

  Future<void> getValidationData() async {
    isTap.value = true;
    var obtainedToken = box.read("token");
    finalEmail = obtainedToken;
    log("Token: $finalEmail");
  }

  doLogin() async {
    bool isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    isTap.value = true;
    bool isSuccess = await AuthRepository().login(
      email: email!,
      password: password!,
    );
    isTap.value = false;

    if (!isSuccess) {
      return Get.snackbar("invalid", "Wrong email or password",
          colorText: Colors.white, backgroundColor: Colors.red[600]);
    }
    Get.offAllNamed(HomeRoutes.home);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
