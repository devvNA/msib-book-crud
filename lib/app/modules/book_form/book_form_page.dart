import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'book_form_controller.dart';

class BookFormPage extends GetView<BookFormController> {
  const BookFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BookForm'),
        centerTitle: true,
      ),
      body: GetBuilder<BookFormController>(builder: (_) {
        return const Center(
          child: Text(
            'BookFormPage is working',
            style: TextStyle(fontSize: 20),
          ),
        );
      }),
    );
  }
}
