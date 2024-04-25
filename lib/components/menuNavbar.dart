import 'package:bookane/views/books_page.dart';
import 'package:bookane/views/home_page.dart';
import 'package:bookane/views/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MenuNavBar extends StatefulWidget {
  const MenuNavBar({super.key});
  static const String routeName = '/MenuNavBar';

  @override
  State<MenuNavBar> createState() => _MenuNavBarState();
}

class _MenuNavBarState extends State<MenuNavBar> {
  int _selectedIndex = 0;
  void _tapbottonNavigator(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const HomePage(),
    const BooksPage(
      grade: "12classe",
    ),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _tapbottonNavigator,
        backgroundColor: Colors.white,
        selectedItemColor: const Color.fromARGB(255, 212, 87, 146),
        selectedLabelStyle:
            const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        selectedIconTheme: const IconThemeData(
            color: Color.fromARGB(255, 212, 87, 146), size: 20),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books), label: 'Livros'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}
