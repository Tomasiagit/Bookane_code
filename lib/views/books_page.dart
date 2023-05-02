import 'package:bookane/views/login_page.dart';
import 'package:bookane/views/reading_page.dart';
import 'package:bookane/views/cadastrar_page.dart';
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
              preferredSize: const Size.fromHeight(130.0),
              child: AppBar(
                title: const Text("BOOKANE"),
                automaticallyImplyLeading: false,
                centerTitle: true,
                backgroundColor:  const Color.fromARGB(255, 63, 4, 30),
                actions: <Widget>[
                  PopupMenuButton(itemBuilder: (context) {
                    return [
                      const PopupMenuItem<int>(
                        value: 0,
                        child: Text("Login"),
                      ),
                      const PopupMenuItem<int>(
                        value: 1,
                        child: Text("Cadrastar-se"),
                      ),
                    ];
                  }, onSelected: (value) {
                    if (value == 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                      );
                    } else if (value == 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CadastrarPage()),
                      );
                    }
                  })
                ],
                bottom: const TabBar( tabs: <Widget>[
                  Tab(
                    text: "12-classe",
                  ),
                  // Tab(
                  //   text: "11-classe",
                  // ),
                  // Tab(
                  //   text: "10-classe",
                  // ),
                  // Tab(
                  //   text: "9-classe",
                  // ),
                  // Tab(
                  //   text: "8-classe",
                  // )
                ]),
              ),
            ),
            body: TabBarView(children: [
              ListView.separated(
                itemCount: 20,
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(
                  endIndent: Checkbox.width,
                  thickness:1,
                  height: 1
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 0.5,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 7.0),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 30),
                                  child: Image.asset(
                                    'assets/reader_girl.png',
                                    width: 100,
                                    height: 80,
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Portugues",
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    "Editora",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w200,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              IconButton(
                                iconSize: 20,
                                icon: const Icon(
                                    Icons.arrow_forward_ios_outlined),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ReadingPage()));
                                },
                              )
                            ],
                          )
                        ]),
                  );
                },
              ),
              // Container(
              //   //for first tab
              //   height: 400,
              //   color: const Color.fromARGB(255, 8, 2, 2),
              // ),
              // Container(
              //   //for first tab
              //   height: 400,
              //   color: Color.fromARGB(255, 255, 255, 255),
              // ),
              // Container(
              //   //for second tab
              //   height: 400,
              //   color: Colors.green,
              // ),
              // Container(
              //   //for third tab
              //   height: 400,
              //   color: Colors.blue,
              // )
            ])));
  }
}
