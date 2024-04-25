import 'dart:convert';

import 'package:bookane/models/book.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class BooksController extends GetxController {
  final RxList<Book> books = <Book>[].obs;

  final database = FirebaseDatabase.instance.ref();

  Future<void> getAllBooks(String grade) async {
    try {
      await database
          .child('books/$grade')
          .onValue
          .listen((DatabaseEvent event) {
        final data = event.snapshot.value as Map<dynamic, dynamic>;
        final List<Book> booksList = data.entries.map((entry) {
          books.clear();
          final data = entry.value as Map<dynamic, dynamic>;
          return Book.fromJson(data, entry.key);
        }).toList();
        for (int i = 0; i < booksList.length; i++) {
          books.add(booksList[i]);
        }
        print("aaa ${jsonEncode(books)}");
      });

      print("object ${jsonEncode(books)}");
    } catch (e) {
      print("Error $e");
    }
  }
}
