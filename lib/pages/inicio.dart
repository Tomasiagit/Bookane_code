import 'package:bookane/pages/base.dart';
import 'package:bookane/views/books_page.dart';
import 'package:bookane/views/login_page.dart';
import 'package:bookane/views/register_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Inicio extends StatefulWidget {
  static const String routeName = '/Inicio';
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
            CarouselSlider(
              items: [
                Container(
                  margin: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: const DecorationImage(
                      image: AssetImage('assets/imagem1.png'),
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
              ],
              options: CarouselOptions(
                height: 190,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
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
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                       Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return const BooksPage();
                    }),
                  );
                      
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.black,
                      ),
                      child: Column(
                        children: const [
                          Text(
                            '12ª',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Classe',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.black,
                    ),
                    child: Column(
                      children: const [
                        Text(
                          '11ª',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Classe',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.black,
                    ),
                    child: Column(
                      children: const [
                        Text(
                          '10ª',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Classe',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
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
}
