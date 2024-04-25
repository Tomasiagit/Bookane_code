import 'package:bookane/firebase_implementation/firebase_auth_services.dart';
import 'package:bookane/provider.dart/cadastro_provider.dart';
import 'package:bookane/views/profile_page.dart';
import 'package:bookane/views/recuperar_user_page.dart';
//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  static const String routeName = '/RegisterPage';

  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _repetirSenhaControler = TextEditingController();
  final FirebaseAuthService _firebaseAuthService = FirebaseAuthService();
  late List<DropdownMenuItem<ListOfClass>> _countryItems;
  late ListOfClass _selectedClass;
  // late List<DropdownMenuItem<ListOfClass>> _classItems;
  // late ListOfClass _selectedClass;

  @override
  void initState() {
    List<ListOfClass> countries = ListOfClass.allClass;
    _countryItems = countries.map<DropdownMenuItem<ListOfClass>>(
      (ListOfClass classOption) {
        return DropdownMenuItem<ListOfClass>(
          value: classOption,
          child: Text(classOption.classes),
        );
      },
    ).toList();
    _selectedClass = countries[0];
    super.initState();
  }

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var widthSize = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0C60A0),
        title: const Text(
          'Registar',
          style: TextStyle(color: Colors.white),
        ),
      ),
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
                  Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: ThemeData().colorScheme.copyWith(
                            primary: const Color.fromARGB(219, 7, 3, 72),
                          ),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _nomeController,

                      //obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nome',
                        prefixIcon: Icon(
                          Icons.person,
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
                            primary: const Color.fromARGB(219, 7, 3, 72),
                          ),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,

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
                  Container(
                    child: DropdownButton<ListOfClass>(
                      isExpanded: true,
                      underline: const SizedBox(),
                      //icon: SvgPicture.asset("assets/icons/dropdown.svg"),
                      value: _selectedClass,
                      items: _countryItems,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedClass = newValue!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: ThemeData().colorScheme.copyWith(
                            primary: const Color.fromARGB(219, 7, 3, 72),
                          ),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _senhaController,
                      validator: (senha) {
                        if (senha!.isEmpty) {
                          return 'Insira a senha';
                        }
                      },
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.key),
                        labelText: 'Senha',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: ThemeData().colorScheme.copyWith(
                            primary: const Color.fromARGB(219, 7, 3, 72),
                          ),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _repetirSenhaControler,
                      validator: (repetirSenha) {
                        if (repetirSenha!.isEmpty) {
                          return 'Insira a senha';
                        } else if (repetirSenha != _senhaController.text) {
                          return 'As senhas nao conscidem';
                        }
                      },
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.key),
                        labelText: 'Repetir senha',
                      ),
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
                                  // Provider.of<CadastrarProvider>(context,
                                  //         listen: false)
                                  //     .cadastrarFunction(
                                  //         _nomeController.text,
                                  //         _emailController.text,
                                  //         _selectedClass.toString(),
                                  //         _repetirSenhaControler.text)
                                  _firebaseAuthService.createUser(
                                      _nomeController.text,
                                      _emailController.text,
                                      _repetirSenhaControler.text);
                                  //     .then((value) {
                                  //   if (value) {
                                  //     Navigator.push(
                                  //       context,
                                  //       MaterialPageRoute(
                                  //           builder: (context) =>
                                  //               const ProfilePage()),
                                  //     );
                                  //   } else {
                                  //     _senhaController.clear();
                                  //     _repetirSenhaControler.clear();
                                  //     ScaffoldMessenger.of(context)
                                  //         .showSnackBar(SnackBar(
                                  //       content: const Text('Erro ao registar'),
                                  //       duration: const Duration(seconds: 3),
                                  //       backgroundColor: Colors.redAccent,
                                  //       action: SnackBarAction(
                                  //         label: 'ok',
                                  //         onPressed: () {},
                                  //       ),
                                  //     ));
                                  //   }
                                  // });
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF0C60A0),
                              ),
                              child: const Text(
                                'Registar',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
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
                                        const RecuperarUserPage()));
                          },
                          child: const Text(
                            'Esqueci a Senha',
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

class ListOfClass {
  final String id;
  final String classes;

  ListOfClass(this.id, this.classes);

  static List<ListOfClass> get allClass => [
        ListOfClass('1', '8classe'),
        ListOfClass('2', '9classe'),
        ListOfClass('3', '10classe'),
        ListOfClass('4', '11classe'),
        ListOfClass('5', '12classe'),
      ];
}

// class CountryOption {
//   final String key;
//   final String fullName;

//   CountryOption(this.key, this.fullName);

//   static List<CountryOption> get allCountries => [
//         CountryOption('nepal', 'Nepal'),
//         CountryOption('india', 'India'),
//         CountryOption('USA', 'United States'),
//         CountryOption('denmark', 'Denmark'),
//         CountryOption('uk', 'UK'),
//         CountryOption('world', 'World Wide'),
//       ];
// }
