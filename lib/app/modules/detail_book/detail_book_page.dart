import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'detail_book_controller.dart';

class DetailBookPage extends GetView<DetailBookController> {
  const DetailBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailBookPage'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          controller.book.title!,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
