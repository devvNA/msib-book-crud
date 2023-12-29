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
      body: const Center(
        child: Text(
          'DetailBookPage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
