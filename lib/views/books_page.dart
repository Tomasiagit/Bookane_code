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
              title: const Text("BOOKANE"),
              automaticallyImplyLeading: false,
              centerTitle: true,
              backgroundColor: const Color(0xFF0C60A0),
              actions: <Widget>[
                PopupMenuButton(itemBuilder: (context) {
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
                }, onSelected: (value) {
                  if (value == 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfilePage()),
                    );
                  } else if (value == 1) {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const RegisterPage()),
                    // );
                  }
                })
              ],
              bottom: const TabBar(tabs: <Widget>[
                Tab(
                  text: "12-classe",
                ),
              ]),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
              ),
              itemCount: 12,
              itemBuilder: (context, index) {
                return const BookItem();
                  
                
              },
            ),
          ),
        ));
  }
}
