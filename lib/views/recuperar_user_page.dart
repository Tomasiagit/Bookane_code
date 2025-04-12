import 'package:bookane/views/login_page.dart';
import 'package:flutter/material.dart';

import '../firebase_implementation/firebase_auth_services.dart';
//import 'package:flutter/src/widgets/container.dart';

class RecuperarUserPage extends StatefulWidget {
  static const String routeName = '/RecuperarUserPage';
  const RecuperarUserPage({super.key});

  @override
  State<RecuperarUserPage> createState() => RecuperarUserPageState();
}

class RecuperarUserPageState extends State<RecuperarUserPage> {
  final _emailController = TextEditingController();
  final FirebaseAuthService _firebaseAuthService = FirebaseAuthService();
  final _formkey = GlobalKey<FormState>();
  bool inLoading = false;

  @override
  Widget build(BuildContext context) {
    var widthSize = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
        backgroundColor: const Color(0xFF0C60A0),
            iconTheme: IconThemeData(
              color: Colors.white, //change your color here
            ),
        title: const Text('Recuperar conta',
            style:
            TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
      ),
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding:  EdgeInsets.all(28.0),
              
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
                  onPressed: () async {

                    if (_formkey.currentState!.validate()) {
                      setState(() {
                        inLoading = true;
                      });
                      await Future.delayed(
                          Duration(seconds: 2));

                      try{
                        bool success = await _firebaseAuthService.resetPasswd(
                          _emailController.text.toString(),

                        );

                        if(success){
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  const LoginPage()));
                        }
                      }catch(e){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("$e"),
                          ),
                        );
                      }
                      setState(() {
                        inLoading = false;
                      });
                    }


                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0C60A0),
                  ),
                  child: const Text(
                    'Recuperar',
                      style:
                      TextStyle(fontWeight: FontWeight.bold, color: Colors.white)
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


