import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:km_book_crud/app/core/theme/app_colors.dart';
import 'detail_book_controller.dart';
import 'widget/text_widget.dart';

class DetailBookPage extends GetView<DetailBookController> {
  const DetailBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.color3,
          ),
          onPressed: () {
            Get.back();
          },
          child: const Text(
            "Back",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: DetailText(controller: controller),
      ),
    );
  }
}
