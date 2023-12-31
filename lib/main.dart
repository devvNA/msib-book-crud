import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:km_book_crud/app/core/theme/theme.dart';

import 'app/core/bindings/application_bindings.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      title: 'Book CRUD',
      initialBinding: ApplicationBindings(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
