import 'package:dio/dio.dart';
import 'package:km_book_crud/app/core/api_endpoints.dart';
import 'package:km_book_crud/app/data/services/network_services.dart';
import '../../core/types.dart';
import '../models/book_model.dart';

class BookRepository {
  Future<ListBook> getListBook() async {
    try {
      final request = Request();

      ListBook books = [];
      var response = await request.get(bookUrl, requiresAuthToken: true);
      Map obj = response.data;

      if (response.statusCode == 200) {
        for (var value in obj["data"]) {
          final result = Book.fromJson(value);
          books.add(result);
        }
        return books;
      }
      return obj["data"];
    } on DioException catch (_) {
      rethrow;
    }
  }

  Future<void> createBook({
    required String isbn,
    required String title,
    required String subtitle,
    required String author,
    required String publisher,
    required int pages,
    required String description,
    required String website,
  }) async {
    try {
      final request = Request();

      var response =
          await request.post("$bookUrl/add", requiresAuthToken: true, body: {
        "isbn": isbn,
        "title": title,
        "subtitle": subtitle,
        "author": author,
        "published": DateTime.now().toString(),
        "publisher": publisher,
        "pages": pages,
        "description": description,
        "website": website
      });
      Map obj = response.data;
      return obj["book"]["id"];
    } on DioException catch (_) {
      rethrow;
    }
  }

  Future<void> updateBook({
    required int id,
    required String isbn,
    required String title,
    required String subtitle,
    required String author,
    required String publisher,
    required int pages,
    required String description,
    required String website,
  }) async {
    try {
      final request = Request();

      await request.put("$bookUrl/$id/edit", requiresAuthToken: true, body: {
        "isbn": isbn,
        "title": title,
        "subtitle": subtitle,
        "author": author,
        "published": DateTime.now().toString(),
        "publisher": publisher,
        "pages": pages,
        "description": description,
        "website": website
      });
    } on DioException catch (_) {
      rethrow;
    }
  }

  Future<void> deleteBook(int id) async {
    try {
      final request = Request();
      await request.delete("$bookUrl/$id", requiresAuthToken: true);
    } on DioException catch (_) {
      rethrow;
    }
  }
}
