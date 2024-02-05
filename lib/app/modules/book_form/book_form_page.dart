// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:km_book_crud/app/core/theme/app_colors.dart';
import 'book_form_controller.dart';
import 'widget/form_widget.dart';

class BookFormPage extends GetView<BookFormController> {
  const BookFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget space = SizedBox(
      height: 8.0,
    );

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 2,
            backgroundColor: AppColor.color3,
          ),
          onPressed: () {
            controller.saveBook();
          },
          child: const Text(
            "Save",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('Book Form'),
        backgroundColor: AppColor.color3,
        centerTitle: true,
      ),
      body: GetBuilder<BookFormController>(builder: (_) {
        return ListView(
          padding: EdgeInsets.all(20.0),
          children: [
            BookForm(
              title: "ISBN",
              isEnabled: false,
              value: controller.isbn,
              onChanged: (value) {
                controller.isbn = value;
              },
            ),
            space,
            BookForm(
              title: "Title",
              value: controller.title,
              onChanged: (value) {
                controller.title = value;
              },
            ),
            space,
            BookForm(
                title: "Subtitle",
                value: controller.subtitle,
                onChanged: (value) {
                  controller.subtitle = value;
                }),
            space,
            BookForm(
                title: "Author",
                value: controller.author,
                onChanged: (value) {
                  controller.author = value;
                }),
            space,
            BookForm(
                title: "Publisher",
                value: controller.publisher,
                onChanged: (value) {
                  controller.publisher = value;
                }),
            space,
            BookForm(
              title: "Pages",
              value: controller.pages.toString(),
              onChanged: (value) {
                controller.pages = int.tryParse(value);
              },
            ),
            space,
            BookForm(
              title: "Description",
              value: controller.description,
              onChanged: (value) {
                controller.description = value;
              },
            ),
            space,
            BookForm(
              title: "Website",
              value: controller.website,
              onChanged: (value) {
                controller.website = value;
              },
            ),
          ],
        );
      }),
    );
  }
}
