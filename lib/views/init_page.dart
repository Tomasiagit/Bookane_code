import 'package:bookane/components/menuNavbar.dart';
import 'package:bookane/views/books_page.dart';
import 'package:bookane/views/login_page.dart';
import 'package:flutter/material.dart';

class InitPage extends StatefulWidget {
  static const String routeName = '/InitPage';
  const InitPage({super.key});

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage>
    with SingleTickerProviderStateMixin {
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
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Image.asset(
                'assets/Bookane11.png',
                width: 300,
                height: 300,
                // scale: 0.5,
                alignment: Alignment.center,
              ),
              const SizedBox(height: 20),
              Image.asset(
                'assets/reader_girl.png',
                width: 200,
                height: 200,
                scale: 0.5,
                alignment: Alignment.center,
              ),
             const SizedBox(height: 60),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                height: 50,
                width: widthSize <= 500 ? widthSize : 400,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MenuNavBar()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(208, 6, 141, 225),
                    ),
                    child: Text(
                      'INICIAR',
                      style: TextStyle(fontSize: 16),
                    )),
              )
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
