import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:km_book_crud/app/core/theme/app_colors.dart';

import 'registration_controller.dart';

class RegistrationPage extends GetView<RegistrationController> {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.color3,
      body: Obx(() {
        return SingleChildScrollView(
          child: SizedBox(
            width: Get.width,
            height: Get.height,
            child: Column(
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
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  height: Get.height / 1.6,
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
                        _namaForm(),
                        const SizedBox(
                          height: 10.0,
                        ),
                        _emailForm(),
                        const SizedBox(
                          height: 10.0,
                        ),
                        _passwordForm(),
                        const SizedBox(
                          height: 10.0,
                        ),
                        _confirmPassword(),
                        const SizedBox(
                          height: 10.0,
                        ),
                        _registratonButton(),
                        const SizedBox(
                          height: 12.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              "Sudah memiliki akun ? ",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: const Text(
                                "Masuk",
                                style: TextStyle(
                                  color: Colors.amber,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
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
            Icons.email,
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

  ElevatedButton _registratonButton() {
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
        controller.doRegistration();
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
              "Daftar",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
    );
  }

  TextFormField _namaForm() {
    return TextFormField(
      onChanged: (value) {
        controller.name = value;
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
        hintText: "Nama",
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
          child: Icon(
            Icons.person,
          ),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "masukkan nama";
        }
        return null;
      },
    );
  }

  TextFormField _confirmPassword() {
    return TextFormField(
      onChanged: (value) {
        controller.confirmPassword = value;
      },
      obscureText: true,
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
        hintText: "Confirm Password",
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
          child: Icon(
            Icons.lock_clock,
          ),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "masukkan konfirmasi password";
        } else if (controller.confirmPassword != controller.password) {
          return "password tidak sama";
        }
        return null;
      },
    );
  }
}
