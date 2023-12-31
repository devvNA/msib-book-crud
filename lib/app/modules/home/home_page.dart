import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:km_book_crud/app/core/theme/app_colors.dart';
import 'package:km_book_crud/app/routes/book_form_routes.dart';
import 'package:km_book_crud/app/routes/detail_book_routes.dart';
import 'home_controller.dart';
import 'widget/book_item.dart';
import 'widget/dialog_logout_widget.dart';

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
          Get.toNamed(BookFormRoutes.bookForm);
        },
      ),
      body: GetBuilder<HomeController>(builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListTile(
                title: const Text("Welcome!"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.user?.name ?? "...",
                      style: const TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                    Text(controller.user?.email ?? "...",
                        style: const TextStyle(
                          fontSize: 10.0,
                        )),
                  ],
                ),
                trailing: IconButton(
                  onPressed: () async {
                    await showDialog<void>(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return DialogLogoutWidget(
                          tapNo: () {
                            Get.back();
                          },
                          tapYes: () {
                            controller.doLogout();
                          },
                        );
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.logout,
                    size: 24.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                "Manage Your Book",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: GetBuilder<HomeController>(builder: (_) {
                  if (controller.listBooks.isEmpty) {
                    return const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            "Tidak ada data",
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  return RefreshIndicator(
                    color: AppColor.color3,
                    onRefresh: () async {
                      controller.onRefresh();
                    },
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: Get.width,
                        height: Get.height,
                        child: LayoutBuilder(
                          builder: (context, constraint) {
                            double spacing = 12;
                            double size =
                                (constraint.biggest.width - spacing) / 2;
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
                                      Get.toNamed(BookFormRoutes.bookForm,
                                          arguments: listBooks);
                                    },
                                    onDelete: () {
                                      controller.deleteBook(listBooks.id!);
                                    },
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        );
      }),
    );
  }
}
