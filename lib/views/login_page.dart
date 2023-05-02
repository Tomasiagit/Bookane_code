import 'package:bookane/provider.dart/login_provider.dart';
import 'package:provider/provider.dart';
import 'package:bookane/views/books_page.dart';
import 'package:bookane/views/recuperar_user_page.dart';
import 'package:bookane/views/cadastrar_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/LoginPage';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

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
      body: Form(
          key: _formkey,
          child: SizedBox.expand(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    'Iniciar sessão',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromARGB(219, 7, 3, 72),
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: ThemeData().colorScheme.copyWith(
                            primary: Color.fromARGB(219, 7, 3, 72),
                          ),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      validator: (email) {
                        if (email == null || email.isEmpty) {
                          return 'por favor, digite o seu email';
                        } else if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(_emailController.text)) {
                          return 'email inválido';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        prefixIcon: Icon(
                          Icons.email,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: ThemeData().colorScheme.copyWith(
                            primary: Color.fromARGB(219, 7, 3, 72),
                          ),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _passwordController,
                      obscureText: false,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.key),
                        labelText: 'Password',
                      ),
                      validator: (password) {
                        if (password == null || password.isEmpty) {
                          return 'Digite a password';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50.0),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          height: 50,
                          width: widthSize <= 500 ? widthSize : 400,
                          child: ElevatedButton(
                              onPressed: () {
                                if (_formkey.currentState!.validate()) {
                                  Provider.of<LoginProvider>(context,
                                          listen: false)
                                      .loginFunction(
                                          _emailController.text.toString(),
                                          _passwordController.text.toString())
                                      .then((value) {
                                    if (value) {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const BooksPage()));
                                    } else {
                                      _passwordController.clear();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content:
                                            const Text('email ou senha errada'),
                                        duration: const Duration(seconds: 3),
                                        backgroundColor: Colors.redAccent,
                                        action: SnackBarAction(
                                          label: 'ok',
                                          onPressed: () {},
                                        ),
                                      ));
                                    }
                                  });
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(219, 7, 3, 72),
                              ),
                              child: const Text(
                                'INICIAR',
                                style: TextStyle(fontSize: 16),
                              )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const RecuperarUserPage()),
                            );
                          },
                          child: const Text(
                            'Esqueci senha',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
      resizeToAvoidBottomInset: false,
    );
  }
}
