import 'package:bookane/firebase_implementation/firebase_auth_services.dart';
import 'package:bookane/provider.dart/user_provider.dart';
import 'package:bookane/views/InfoPage.dart';
import 'package:bookane/views/overview_page.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:bookane/views/books_page.dart';
import 'package:bookane/views/recuperar_user_page.dart';
//import 'package:bookane/views/register_page.dart';
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
  final FirebaseAuthService _firebaseAuthService = FirebaseAuthService();
  final userProvider = UserProvider();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool inLoading = false;


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
    //private FirebaseAuth mAuth;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0C60A0),
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: const Text('Entrar',
        style: TextStyle(
          color:Color(0xFFFFFFFF)
        ),),
        actions: [

          IconButton(
            icon: const Icon(Icons.info,
              color: Colors.white,), // User icon
            onPressed: () {
              // Action when icon is pressed
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const InfoPage()),
              );
            },
          ),

        ],
      ),
      body: Stack(
        children: [
           Center(
             child: Form(
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
                              color: Color(0xFF0C60A0),
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: ThemeData().colorScheme.copyWith(
                              primary: const Color(0xFF0C60A0),
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
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(40.0)),
                              ),
                              labelText: 'E-mail',
                              prefixIcon: Icon(
                                Icons.email,
                              ),
                              isDense: true,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: ThemeData().colorScheme.copyWith(
                              primary: const Color(0xFF0C60A0),
                            ),
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            controller: _passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(40.0)),
                                ),
                                prefixIcon: Icon(Icons.key),
                                labelText: 'Senha',
                                isDense: true),
                            validator: (password) {
                              if (password == null || password.isEmpty) {
                                return 'Digite a sua senha';
                              }
                              return null;
                            },
                          ),
                        ),
                        // const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 50.0),
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 40),
                                // height: 50,
                                width: widthSize <= 500 ? widthSize : 400,
                                child: ElevatedButton(
                                    onPressed: () async {

                                      if (_formkey.currentState!.validate()) {
                                        setState(() {
                                          inLoading = true;
                                        });
                                        await Future.delayed(
                                            Duration(seconds: 2));

                                        try{
                                          // bool success = await _firebaseAuthService.authentication(
                                          //   _emailController.text.toString(),
                                          //   _passwordController.text.toString(),
                                          // );
                                          bool success = await userProvider.loginFunction(
                                              _emailController.text.toString(),
                                              _passwordController.text.toString());

                                          if(success){
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                    const OverViewPage(classe: "10-classe")));


                                          }else{
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              const SnackBar(
                                                content: Text("Falha na autenticação. Verifique suas credenciais."),
                                              ),
                                            );
                                          }
                                        }catch(e){
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text("Erro ao autenticar: $e"),

                                            ),
                                          );
                                        }
                                        setState(() {
                                          inLoading = false;
                                        });
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF0C60A0),
                                      side: BorderSide.none,
                                      shape: const StadiumBorder(),
                                    ),
                                    child: const Text(
                                      'Iniciar',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white
                                      ),
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
           ),
          if (inLoading)
            Positioned.fill(
              child: Container(
                color: Colors.black38, // Semi-transparent overlay
                child: Center(

                    child: LoadingAnimationWidget.waveDots(
                        color: Color.fromARGB(255, 254, 207, 0), size: 70)
                ),
              ),
            )


        ],

      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
