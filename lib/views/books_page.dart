import 'package:bookane/views/components/book_item.dart';
// import 'package:bookane/views/login_page.dart';
import 'package:bookane/views/profile_page.dart';
// import 'package:bookane/views/reading_page.dart';
import 'package:bookane/views/register_page.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

class BooksPage extends StatefulWidget {
  static const String routeName = '/BooksPage';
  const BooksPage({super.key});

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  List<BookItem> books = const [
    BookItem(
      imagepath: 'assets/12-classe/filosofia12.jpg',
      pdfpath: 'assets/filosofia12.pdf',
      bookTitle: 'Filosofia',
    ),
    BookItem(
      imagepath: 'assets/12-classe/fisica12.jpg',
      pdfpath: 'assets/filosofia12.pdf',
      bookTitle: 'Fisica',
    ),
    BookItem(
      imagepath: 'assets/12-classe/geografia12.jpg',
      pdfpath: 'assets/filosofia12.pdf',
      bookTitle: 'Geografia',
    ),
    BookItem(
      imagepath: 'assets/12-classe/matematica12.jpg',
      pdfpath: 'assets/filosofia12.pdf',
      bookTitle: 'Matematica',
    ),
    BookItem(
      imagepath: 'assets/12-classe/portugues12.jpg',
      pdfpath: 'assets/filosofia12.pdf',
      bookTitle: 'Portugues',
    ),
    BookItem(
      imagepath: 'assets/12-classe/quimica12.PNG',
      pdfpath: 'assets/filosofia12.pdf',
      bookTitle: 'Quimica',
    ),
  ];
  @override
  Widget build(BuildContext context) {
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
              PopupMenuButton(
                  iconColor: Colors.white,
                  // color: Colors.white,
                  itemBuilder: (context) {
                    return [
                      const PopupMenuItem<int>(
                        value: 0,
                        child: Text("Perfil"),
                      ),
                      const PopupMenuItem<int>(
                        value: 1,
                        child: Text("Cadrastar-se"),
                      ),
                    ];
                  },
                  onSelected: (value) {
                    if (value == 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfilePage()),
                      );
                    } else if (value == 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterPage()),
                      );
                    }
                  })
            ],
            bottom: const TabBar(
              labelColor: Color.fromARGB(255, 254, 207, 0),
              indicatorColor: Color.fromARGB(255, 254, 207, 0),
              tabs: [
                Tab(
                  text: "12-classe",
                ),
              ],
            ),
          ),
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 2,
            childAspectRatio: .65,
          ),
          itemCount: books.length,
          itemBuilder: (context, index) {
            return books[index];
          },
        ),
      ),
    );
  }
}
