import 'package:bookane/pages/base.dart';
import 'package:bookane/provider.dart/books_controller.dart';
import 'package:bookane/views/books_page.dart';
import 'package:bookane/views/login_page.dart';
import 'package:bookane/views/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import '../views/components/card_classe.dart';

class Inicio extends StatefulWidget {
  // final String classe;
  // final int IDclasse;
  static const String routeName = '/Inicio';
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> with SingleTickerProviderStateMixin {
//  late AnimationController _controller;
  late PageController _pageViewController;
  late TabController _tabController;
  int _currentPageIndex = 0;
  int _currentPage = 1;
  int _totalPages = 0;
  final bookController = Get.put(BooksController());

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  //  _controller = AnimationController(vsync: this);
   // bookController.getAllBooks(widget.classe, widget.IDclasse);
  }

  @override
  void dispose() async{
   // _controller.dispose();
    super.dispose();
    await DefaultCacheManager().emptyCache();
    _pageViewController.dispose();
    _tabController.dispose();

  }

  @override
  Widget build(BuildContext context) {
    var widthSize = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),

        Expanded(

          child: SizedBox(
            height: 200.0,
            child: PageView(
                controller: _pageViewController,
                onPageChanged: _handlePageViewChanged,
              children: [

                    Container(
                      margin: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: const DecorationImage(
                          image: AssetImage('assets/nobackground.png'),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: const DecorationImage(
                          image: AssetImage(
                            'assets/imagem2.png',
                          ),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: const DecorationImage(
                            image: AssetImage('assets/imagem3.png'),
                              fit: BoxFit.fitHeight,
                            ))),
                  ]

            ),
          ),
        ),

        const SizedBox(
              height: 10,
            ),
            const Text(
              'Bookane',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                fontFamily: 'Poppins',
                // color: const Color(0xFF0C60A0),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Esta plataforma foi criada com intuito de facilitar o acesso a livros aos alunos do ensino secundario em Mocambique.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Encontre a sua Classe',
              textAlign: TextAlign.start,
              style:
                  TextStyle(color: Color.fromARGB(255, 14, 3, 3), fontSize: 14),
            ),
           const Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CardClasse(cls: '12-classe', ordinary:'12ª'),
                  SizedBox(
                    width: 10,
                  ),
                  CardClasse(cls: '11-classe', ordinary:'11ª'),
                  SizedBox(
                    width: 10,
                  ),
                  CardClasse(cls: '10-classe', ordinary:'10ª'),



                  SizedBox(
                    width: 10,
                  )
                ],
              ),
            ),
            const Text(
              'Já tem conta? Entre ou crie uma conta.',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Color.fromARGB(255, 14, 3, 3),
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return const LoginPage();
                    }),
                  );
                },
                // => Get.to(() => const UpdateProfileScreen()
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0C60A0),
                  side: BorderSide.none,
                  shape: const StadiumBorder(),
                ),
                child: const Text(
                  'Entrar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 200,
              child: OutlinedButton(
                onPressed: () {
                     Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return const RegisterPage();
                    }),
                  );
                },
                // => Get.to(() => const UpdateProfileScreen()
                style: OutlinedButton.styleFrom(
                  // backgroundColor: Color.fromARGB(255, 138, 133, 135),
                  // side: BorderSide.none,
                  shape: const StadiumBorder(),
                ),
                child: const Text(
                  'Criar conta',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }

  void _handlePageViewChanged(int currentPageIndex) {
    // if (!_isOnDesktopAndWeb) {
    //   return;
    // }
    _tabController.index = currentPageIndex;
    setState(() {
      _currentPageIndex = currentPageIndex;
    });
  }

  void _updateCurrentPageIndex(int index) {
    _tabController.index = index;
    _pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }
}


