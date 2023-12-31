import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:km_book_crud/app/core/theme/app_colors.dart';
import 'package:km_book_crud/app/routes/book_form_routes.dart';
import 'package:km_book_crud/app/routes/detail_book_routes.dart';
import 'home_controller.dart';
import 'widget/book_item.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        backgroundColor: AppColor.color3,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.color3,
        clipBehavior: Clip.hardEdge,
        child: const Icon(Icons.add),
        onPressed: () {
          Get.bottomSheet(
              clipBehavior: Clip.hardEdge,
              elevation: 2,
              SizedBox(
                height: Get.height / 2,
                child: Column(
                  children: <Widget>[
                    ListTile(
                        leading: const Icon(Icons.music_note),
                        title: const Text('Menu 1'),
                        onTap: () => {}),
                    ListTile(
                      leading: const Icon(Icons.videocam),
                      title: const Text('Menu 2'),
                      onTap: () => {},
                    ),
                  ],
                ),
              ),
              backgroundColor: Colors.white);
        },
      ),
      body: GetBuilder<HomeController>(builder: (_) {
        if (controller.listBooks.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColor.color1,
            ),
          );
        }
        return RefreshIndicator(
          color: AppColor.color3,
          onRefresh: () async {
            controller.onRefresh();
          },
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(14.0),
            child: LayoutBuilder(
              builder: (context, constraint) {
                double spacing = 12;
                double size = (constraint.biggest.width - spacing) / 2;

                return Wrap(
                  spacing: spacing,
                  runSpacing: spacing,
                  children: List.generate(
                    controller.listBooks.length,
                    (index) {
                      final listBooks = controller.listBooks[index];

                      return BookItem(
                        size: size,
                        book: listBooks,
                        onTap: () {
                          Get.toNamed(DetailBookRoutes.detailBook,
                              arguments: listBooks);
                        },
                        onEdit: () {
                          Get.toNamed(BookFormRoutes.bookForm);
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ),
        );
      }),
    );
  }
}
