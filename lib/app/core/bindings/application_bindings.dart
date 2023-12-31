import 'package:get/get.dart';
import 'package:km_book_crud/app/modules/auth/login/login_binding.dart';
import 'package:km_book_crud/app/modules/auth/registration/registration_binding.dart';
import 'package:km_book_crud/app/modules/book_form/book_form_binding.dart';
import 'package:km_book_crud/app/modules/detail_book/detail_book_binding.dart';
import 'package:km_book_crud/app/modules/home/home_binding.dart';

class ApplicationBindings extends Bindings {
  @override
  void dependencies() {
    LoginBinding().dependencies();
    RegistrationBinding().dependencies();
    DetailBookBinding().dependencies();
    HomeBinding().dependencies();
    BookFormBinding().dependencies();
  }
}
