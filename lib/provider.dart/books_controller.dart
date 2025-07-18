import 'dart:convert';

import 'package:bookane/models/book.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../api_controller/base_api_url.dart';
import '../models/livro.dart';

class BooksController extends GetxController {
  //final RxList<Book> books = <Book>[].obs;
  var books = <Livro>[].obs;

  //final database = FirebaseDatabase.instance.ref();

  Future getAllBooks(String classe) async {
    //String? grade;
    int? classeID;
    if (classe == "8-classe") {
      classeID = 1;
    } else if (classe == "9-classe") {
      classeID = 2;
    } else if (classe == "10-classe") {
      classeID = 3;
    } else if (classe == "11-classe") {
      classeID = 4;
    } else {
      classeID = 5;
    }


    try {
      var url = Uri.parse('${BaseApiUrl.listaDelivrosPorClasseUrl}$classeID');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        final List<dynamic> listLivros = data;
        print("Livros: $listLivros");
        return listLivros.map((json) => Livro.fromJson(json)).toList();
      } else {
        print("Erro de conexão: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error $e");
    }
  }

  Future<void> fetchBooks(String classe) async {
    try {
      List<Livro>? livros = await getAllBooks(classe);
      if (livros != null) {
        books.value = livros;
      }
    } catch (e) {
      print('Erro ao buscar livros: $e');
    }
  }


    //-------------------Firebase implementations ---------------//
    // try {
    //   await database
    //       .child('books/$grade')
    //       .onValue
    //       .listen((DatabaseEvent event) {
    //     final data = event.snapshot.value as Map<dynamic, dynamic>;
    //     final List<Book> booksList = data.entries.map((entry) {
    //       books.clear();
    //       final data = entry.value as Map<dynamic, dynamic>;
    //       return Book.fromJson(data, entry.key);
    //     }).toList();
    //     for (int i = 0; i < booksList.length; i++) {
    //       books.add(booksList[i]);
    //     }
    //     print("aaa ${jsonEncode(books)}");
    //   });
    //
    //   print("object ${jsonEncode(books)}");
    // } catch (e) {
    //   print("Error $e");
    // }
 // }
}
