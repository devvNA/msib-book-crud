import 'package:get/get.dart';

import '../modules/detail_book/detail_book_binding.dart';
import '../modules/detail_book/detail_book_page.dart';

class DetailBookRoutes {
  DetailBookRoutes._();

  static const detailBook = '/detail-book';

  static final routes = [
    GetPage(
      name: detailBook,
      page: () => const DetailBookPage(),
      binding: DetailBookBinding(),
    ),
  ];
}
