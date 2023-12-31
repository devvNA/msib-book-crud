import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:km_book_crud/app/core/theme/app_colors.dart';
import 'package:km_book_crud/app/modules/auth/login/login_controller.dart';
import 'package:km_book_crud/app/routes/home_routes.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.color3,
      body: Obx(() {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Expanded(
              child: Icon(
                Icons.supervised_user_circle,
                size: 200.0,
                color: AppColor.color2,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              height: Get.height / 2,
              decoration: const BoxDecoration(
                color: AppColor.color2,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32)),
              ),
              child: Form(
                key: controller.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _emailForm(),
                    const SizedBox(
                      height: 10.0,
                    ),
                    _passwordForm(),
                    const SizedBox(
                      height: 15.0,
                    ),
                    _loginButton(),
                    const SizedBox(
                      height: 15.0,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Get.toNamed(HomeRoutes.home);
                      },
                      child: const Text(
                        "DEV",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  TextFormField _emailForm() {
    return TextFormField(
      onChanged: (value) {
        controller.email = value;
      },
      scrollPadding: EdgeInsets.only(bottom: Get.height),
      cursorColor: AppColor.color1,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 0),
        prefixIconColor: AppColor.color1,
        suffixIconColor: AppColor.color1,
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide.none,
        ),
        hintText: "Email",
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
          child: Icon(
            Icons.person,
          ),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "masukkan email";
        } else if (controller.regex.hasMatch(value)) {
          return null;
        }
        return "email tidak valid";
      },
    );
  }

  TextFormField _passwordForm() {
    return TextFormField(
      onChanged: (value) {
        controller.password = value;
      },
      obscureText: controller.visible.value,
      scrollPadding: EdgeInsets.only(bottom: Get.height),
      cursorColor: AppColor.color1,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 0),
        prefixIconColor: AppColor.color1,
        suffixIconColor: AppColor.color1,
        fillColor: Colors.white,
        filled: true,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide.none,
        ),
        hintText: "Password",
        prefixIcon: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
          child: Icon(
            Icons.lock,
          ),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            controller.visible.value = !controller.visible.value;
            log(controller.visible.toString());
          },
          icon: Icon(
            controller.visible.value
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
            size: 20.0,
          ),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "masukkan password";
        } else if (controller.password!.length < 8) {
          return "kata sandi harus 8 karakter atau lebih";
        }
        return null;
      },
    );
  }

  ElevatedButton _loginButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.color3,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        maximumSize: const Size(double.infinity, 42),
        minimumSize: const Size(double.infinity, 42),
      ),
      onPressed: () {
        controller.doLogin();
      },
      child: controller.isTap.value
          ? const SizedBox(
              height: 25,
              width: 25,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                color: Colors.white,
              ),
            )
          : const Text(
              "Masuk",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
    );
  }
}
