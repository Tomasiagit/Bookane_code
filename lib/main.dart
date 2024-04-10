import 'package:bookane/components/menuNavbar.dart';
import 'package:bookane/pages/inicio.dart';
import 'package:bookane/provider.dart/cadastro_provider.dart';
import 'package:bookane/provider.dart/login_provider.dart';
import 'package:bookane/provider.dart/profile_provider.dart';
import 'package:bookane/views/books_page.dart';
//import 'package:bookane/views/register_page.dart';
import 'package:bookane/views/home_page.dart';
import 'package:bookane/views/init_page.dart';
import 'package:bookane/views/login_page.dart';
import 'package:bookane/views/profile_page.dart';
import 'package:bookane/views/recuperar_user_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginProvider>(
          create: (context) => LoginProvider(),
        ),
        ChangeNotifierProvider<CadastrarProvider>(
          create: (context) => CadastrarProvider(),
        ),
        ChangeNotifierProvider<ProfileProvider>(
          create: (context) => ProfileProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bookane',
        theme: ThemeData(
          fontFamily: 'Poppins',
        ),
        home: const Inicio(),
        routes: {
          InitPage.routeName: (context) => const InitPage(),
          MenuNavBar.routeName: (context) => const MenuNavBar(),
          HomePage.routeName: (context) => const HomePage(),
          BooksPage.routeName: (context) => const BooksPage(),
          ProfilePage.routeName: (context) => const ProfilePage(),
          LoginPage.routeName: (context) => const LoginPage(),
          RecuperarUserPage.routeName: (context) => const RecuperarUserPage(),
          //   RegisterPage.routeName: (context) => const RegisterPage(),
        },
      ),
    );
  }
}
