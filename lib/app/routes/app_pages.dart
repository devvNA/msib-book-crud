// ignore_for_file: constant_identifier_names

import 'home_routes.dart';
import 'detail_book_routes.dart';
import 'profile_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = '/home';

  static final routes = [
    ...HomeRoutes.routes,
    ...DetailBookRoutes.routes,
    ...ProfileRoutes.routes,
  ];
}
