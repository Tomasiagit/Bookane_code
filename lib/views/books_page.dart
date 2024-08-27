import 'package:bookane/provider.dart/books_controller.dart';
import 'package:bookane/views/components/book_item.dart';
// import 'package:bookane/views/login_page.dart';
import 'package:bookane/views/profile_page.dart';
// import 'package:bookane/views/reading_page.dart';
import 'package:bookane/views/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

class BooksPage extends StatefulWidget {
  static const String routeName = '/BooksPage';
  final String grade;
  const BooksPage({super.key, required this.grade});

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  final bookController = Get.put(BooksController());
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bookController.getAllBooks(widget.grade);
  }

  @override
  Widget build(BuildContext context) {
    String classe = widget.grade;
    return DefaultTabController(
      //initialIndex: 1, //optional, starts from 0, select the tab by default
      length: 1,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90.0),
          child: AppBar(
            title: const Text(
              "BOOKANE",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            automaticallyImplyLeading: false,
            centerTitle: true,
            backgroundColor: const Color(0xFF0C60A0),
            actions: [

              IconButton(
                icon: Icon(Icons.account_circle,
                color: Colors.white,), // User icon
                onPressed: () {
                  // Action when icon is pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfilePage()),
                  );
                },
              ),

            ],
            bottom: TabBar(
              labelColor: Color.fromARGB(255, 254, 207, 0),
              indicatorColor: Color.fromARGB(255, 254, 207, 0),
              tabs: [
                Tab(
                  text: classe,
                ),
              ],
            ),
          ),
        ),
        body: Obx(
          () => GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 2,
              childAspectRatio: .65,
            ),
            itemCount: bookController.books.length,
            itemBuilder: (context, index) {
              var book = bookController.books[index];
              return BookItem(book: book);
            },
          ),
        ),
      ),
    );
  }
}
