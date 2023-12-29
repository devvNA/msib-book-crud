import 'package:get/get.dart';
import 'package:km_book_crud/app/modules/home/home_binding.dart';

class ApplicationBindings extends Bindings {
  @override
  void dependencies() {
    HomeBinding();
  }
}
