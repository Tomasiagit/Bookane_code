import 'package:bookane/views/components/book_item.dart';
import 'package:bookane/views/login_page.dart';
import 'package:bookane/views/profile_page.dart';
import 'package:bookane/views/reading_page.dart';
import 'package:bookane/views/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BooksPage extends StatefulWidget {
  static const String routeName = '/BooksPage';
  const BooksPage({super.key});

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        //initialIndex: 1, //optional, starts from 0, select the tab by default
        length: 1,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(90.0),
            child: AppBar(
              title:
                  const Text("BOOKANE", style: TextStyle(color: Colors.white)),
              automaticallyImplyLeading: false,
              centerTitle: true,
              backgroundColor: const Color(0xFF0C60A0),
              actions: <Widget>[
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
                  tabs: <Widget>[
                    Tab(
                      text: "12-classe",
                    ),
                  ]),
            ),
          ),
          body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 2,
                ),
                scrollDirection: Axis.vertical,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ReadingPage(
                                                  pdfPath:
                                                      'assets/filosofia12.pdf'
                                                  //  pdfPath: pdfpath
                                                  )));
                                },
                                child: Image.asset(
                                  //  '${widget.imagepath}'
                                  'assets/12-classe/filosofia12.jpg',
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'Filosofia',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ReadingPage(
                                                  pdfPath:
                                                      'assets/filosofia12.pdf'
                                                  //  pdfPath: pdfpath
                                                  )));
                                },
                                child: Image.asset(
                                  //  '${widget.imagepath}'
                                  'assets/12-classe/fisica12.jpg',
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'Fisica',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ReadingPage(
                                                  pdfPath:
                                                      'assets/filosofia12.pdf'
                                                  //  pdfPath: pdfpath
                                                  )));
                                },
                                child: Image.asset(
                                  //  '${widget.imagepath}'
                                  'assets/12-classe/geografia12.jpg',
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'Geografia',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ReadingPage(
                                                  pdfPath:
                                                      'assets/filosofia12.pdf'
                                                  //  pdfPath: pdfpath
                                                  )));
                                },
                                child: Image.asset(
                                  //  '${widget.imagepath}'
                                  'assets/12-classe/matematica12.jpg',
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'Matematica',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ReadingPage(
                                  pdfPath: 'assets/portugues12.pdf'
                                  //  pdfPath: pdfpath
                                  )));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ReadingPage(
                                                  pdfPath:
                                                      'assets/portugues12.pdf'
                                                  //  pdfPath: pdfpath
                                                  )));
                                },
                                child: Image.asset(
                                  //  '${widget.imagepath}'
                                  'assets/12-classe/portugues12.jpg',
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'Portugues',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ReadingPage(
                                                  pdfPath:
                                                      'assets/filosofia12.pdf'
                                                  //  pdfPath: pdfpath
                                                  )));
                                },
                                child: Image.asset(
                                  'assets/12-classe/quimica12.PNG',
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'Quimica',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ReadingPage(
                                                  pdfPath:
                                                      'assets/filosofia12.pdf'
                                                  //  pdfPath: pdfpath
                                                  )));
                                },
                                child: Image.asset(
                                  //  '${widget.imagepath}'
                                  'assets/12-classe/filosofia12.jpg',
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'Filosofia',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ReadingPage(
                                                  pdfPath:
                                                      'assets/filosofia12.pdf'
                                                  //  pdfPath: pdfpath
                                                  )));
                                },
                                child: Image.asset(
                                  //  '${widget.imagepath}'
                                  'assets/12-classe/fisica12.jpg',
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'Fisica',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )

// child:
//             GridView.builder(
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 childAspectRatio: 0.75,
//                 mainAxisSpacing: 16.0,
//                 crossAxisSpacing: 16.0,
//               ),
//               itemCount: 12,
//               itemBuilder: (context, index) {
//                 return const BookItem();
//               },
//             ),
              ),
        ));
  }
}
