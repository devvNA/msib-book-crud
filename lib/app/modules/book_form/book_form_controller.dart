// ignore_for_file: unnecessary_overrides, unnecessary_null_comparison

import 'dart:math';

import 'package:get/get.dart';
import 'package:km_book_crud/app/data/repositories/book_repository.dart';
import 'package:km_book_crud/app/modules/home/home_controller.dart';

import '../../data/models/book_model.dart';

class BookFormController extends GetxController {
  Book? book = Get.arguments;

  String? isbn =
      "997${List.generate(10, (index) => Random().nextInt(6)).join()}";
  String? title;
  String? subtitle;
  String? author;
  String? publisher;
  int? pages = 0;
  String? description;
  String? website;

  bool get isEditMode => book != null;

  @override
  void onInit() {
    if (isEditMode) {
      isbn = book!.isbn!;
      title = book!.title;
      subtitle = book!.subtitle;
      author = book!.author;
      publisher = book!.publisher;
      pages = book!.pages;
      description = book!.description;
      website = book!.website;
    }
    super.onInit();
  }

  saveBook() async {
    if (isEditMode) {
      await BookRepository().updateBook(
        id: book!.id!,
        isbn: isbn!,
        title: title!,
        subtitle: subtitle!,
        author: author!,
        publisher: publisher!,
        pages: pages!,
        description: description!,
        website: website!,
      );
    } else {
      await BookRepository().createBook(
          isbn: isbn!,
          title: title!,
          subtitle: subtitle!,
          author: author!,
          publisher: publisher!,
          pages: pages!,
          description: description!,
          website: website!);
    }
    Get.find<HomeController>().onRefresh();
    Get.back();
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
