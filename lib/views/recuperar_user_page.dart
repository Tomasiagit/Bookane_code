import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';

class RecuperarUserPage extends StatefulWidget {
  static const String routeName = '/RecuperarUserPage';
  const RecuperarUserPage({super.key});

  @override
  State<RecuperarUserPage> createState() => RecuperarUserPageState();
}

class RecuperarUserPageState extends State<RecuperarUserPage> {
  final _emailController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var widthSize = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: const EdgeInsets.all(28.0),
                child: Text(
                  'Recuperar conta',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Color.fromARGB(219, 7, 3, 72),
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 12,
              ),
              Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: ThemeData().colorScheme.copyWith(
                        primary: Color.fromARGB(219, 7, 3, 72),
                      ),
                ),
                child: TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
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
                  //obscureText: true,
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
              SizedBox(
                height: 50,
                width: widthSize >= 500 ? widthSize : 200,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(219, 7, 3, 72),
                  ),
                  child: const Text(
                    'Recuperar',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
