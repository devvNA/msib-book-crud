import 'package:get/get.dart';

import '../modules/book_form/book_form_binding.dart';
import '../modules/book_form/book_form_page.dart';

class BookFormRoutes {
  BookFormRoutes._();

  static const bookForm = '/book-form';

  static final routes = [
    GetPage(
      name: bookForm,
      page: () => const BookFormPage(),
      binding: BookFormBinding(),
    ),
  ];
}
