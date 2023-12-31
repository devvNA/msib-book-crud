// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';
import 'package:km_book_crud/app/data/repositories/book_repository.dart';

class BookFormController extends GetxController {
  int? userId;
  String? isbn;
  String? title;
  String? subtitle;
  String? author;
  DateTime? published;
  String? publisher;
  int? pages;
  String? description;
  String? website;

  @override
  void onInit() {
    super.onInit();
  }

  addBook() async {
    await BookRepository().createBook(
        userId: userId!,
        isbn: isbn!,
        title: title!,
        subtitle: subtitle!,
        author: author!,
        published: published!,
        publisher: publisher!,
        pages: pages!,
        description: description!,
        website: website!);
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
