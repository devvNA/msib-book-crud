// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';

import '../../core/types.dart';
import '../../data/repositories/book_repository.dart';

class HomeController extends GetxController {
  ListBook listBooks = [];

  @override
  void onInit() {
    getBooks();
    super.onInit();
  }

  getBooks() async {
    var data = await BookRepository().getListBook();
    listBooks = data;
    update();
  }

  onRefresh() async {
    listBooks.clear();
    update();
    getBooks();
  }

  @override
  void onReady() {
    // getBooks();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
