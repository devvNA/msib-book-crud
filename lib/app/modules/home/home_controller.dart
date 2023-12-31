// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:km_book_crud/app/data/repositories/auth_repository.dart';
import 'package:km_book_crud/app/routes/auth_routes.dart';

import '../../core/types.dart';
import '../../data/models/user_model.dart';
import '../../data/repositories/book_repository.dart';

class HomeController extends GetxController {
  final box = GetStorage();
  ListBook listBooks = [];
  User? user;

  @override
  void onInit() {
    getBooks();
    getUser();
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

  deleteBook(int id) async {
    await BookRepository().deleteBook(id);
    update();
    getBooks();
  }

  doLogout() async {
    await AuthRepository().logout();
    box.erase();
    Get.offAllNamed(AuthRoutes.login);
  }

  getUser() async {
    var response = await AuthRepository().getUser();
    user = response;
    update();
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
