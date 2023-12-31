// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:km_book_crud/app/routes/auth_routes.dart';
import '../../../data/repositories/auth_repository.dart';

class RegistrationController extends GetxController {
  final box = GetStorage();
  final formKey = GlobalKey<FormState>();
  final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$');
  final isTap = false.obs;
  final visible = true.obs;
  final books = [].obs;

  String? name;
  String? email;
  String? password;
  String? confirmPassword;

  doRegistration() async {
    bool isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    isTap.value = true;
    bool isSuccess = await AuthRepository().register(
        name: name!,
        email: email!,
        password: password!,
        passwordConfirmation: confirmPassword!);
    isTap.value = false;

    if (!isSuccess) {
      update();
      return Get.snackbar("Invalid", "error registration",
          colorText: Colors.white, backgroundColor: Colors.red[600]);
    } else {
      update();
      Get.offAllNamed(AuthRoutes.login);
      return Get.snackbar("Success", "please login",
          backgroundColor: Colors.green, colorText: Colors.white);
    }
  }

  @override
  void onInit() {
    super.onInit();
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
