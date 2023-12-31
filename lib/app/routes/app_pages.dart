// ignore_for_file: constant_identifier_names

import 'detail_book_routes.dart';
import 'profile_routes.dart';
import 'auth_routes.dart';
import 'home_routes.dart';
import 'book_form_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = '/auth/login';

  static final routes = [
    ...AuthRoutes.routes,
    ...DetailBookRoutes.routes,
    ...ProfileRoutes.routes,
    ...HomeRoutes.routes,
		...BookFormRoutes.routes,
  ];
}
