import 'package:get/get.dart';

import 'book_form_controller.dart';

class BookFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookFormController>(
      () => BookFormController(),
    );
  }
}
