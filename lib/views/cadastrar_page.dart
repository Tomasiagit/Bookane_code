import 'package:bookane/provider.dart/cadastro_provider.dart';
import 'package:bookane/views/profile_page.dart';
import 'package:bookane/views/recuperar_user_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class CadastrarPage extends StatefulWidget {
  static const String routeName = '/CadastrarPage';

  const CadastrarPage({super.key});

  @override
  State<CadastrarPage> createState() => _CadastrarPageState();
}

class _CadastrarPageState extends State<CadastrarPage> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _repetirSenhaControler = TextEditingController();
  late List<DropdownMenuItem<ListOfClass>> _classItems;
  late ListOfClass _selectedClass;

  void initState(){
    List<ListOfClass> classes = ListOfClass.allClass;
    _classItems = classes.map<DropdownMenuItem<ListOfClass>>(
      (ListOfClass listofClass){
        return DropdownMenuItem<ListOfClass>(
           value: listofClass,
         child:Text(listofClass.classes),

        );
      }
    ).toList();
    _selectedClass = classes[0];
     super.initState();
  }


  final _formkey = GlobalKey<FormState>();
 
   Map<String, String> classes = <String, String>{
    '1': '8-classe',
    '2': '9-classe',
    '3': '10-classe',
    '4': '11-classe',
    '6': '12-classe',
  };

  @override
  Widget build(BuildContext context) {
    var widthSize = MediaQuery.of(context).size.width;
   String selectedItem = classes.keys.last;
    //String selectedItem = classes;

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
                    'Registrar',
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
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child:
                        //  child: DropdownButton<String? item>(
                        //   isExpanded: true,
                        //   value: _selectedClass,
                        //   items: _classItems,
                        //   onChanged: (e){
                        //     setState(() {
                        //       _selectedClass = item!
                        //     });
                        //   },)
                        //
                        DropdownButton<String>(
                          value: selectedItem,
                          onChanged: (String? value) {
                            // This is called when the user selects an item.
                            setState(() => selectedItem = value!);
                          },
                          selectedItemBuilder: (BuildContext context) {
                            return classes.values.map<Widget>((String item) {
                              // This is the widget that will be shown when you select an item.
                              // Here custom text style, alignment and layout size can be applied
                              // to selected item string.
                              return Container(
                                alignment: Alignment.centerLeft,
                                constraints:
                                    const BoxConstraints(minWidth: 100),
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w600),
                                ),
                              );
                            }).toList();
                          },
                          items: classes.values
                              .map<DropdownMenuItem<String>>((String item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Text(classes.toString()),
                            );
                          }).toList(),
                        ),
                      ),
                      // DropdownButton<String>(
                      //   hint: const Text(
                      //     'Selecione a sua classe de Frequencia',
                      //     style: TextStyle(fontSize: 14),
                      //   ),
                      //   value: dropdownValue,
                      //   elevation: 1,
                      //   style: const TextStyle(
                      //       color: Color.fromARGB(255, 65, 65, 66)),
                      //   onChanged: (String? value) {
                      //     // This is called when the user selects an item.
                      //     setState(() {
                      //       dropdownValue = value!;
                      //     });
                      //   },
                      //   items: dropClasses
                      //       .map<DropdownMenuItem<String>>((String value) {
                      //     return DropdownMenuItem<String>(
                      //       value: value,
                      //       child: Text(value),
                      //     );
                      //   }).toList(),
                      // ),
                    ],
                  ),

                  // Theme(
                  //   data: Theme.of(context).copyWith(
                  //     colorScheme: ThemeData().colorScheme.copyWith(
                  //           primary: Color.fromARGB(219, 7, 3, 72),
                  //         ),
                  //   ),
                  //   child: TextFormField(
                  //     keyboardType: TextInputType.emailAddress,

                  //     //obscureText: true,
                  //     decoration: InputDecoration(
                  //       border: OutlineInputBorder(),
                  //       labelText: 'Classe',
                  //       prefixIcon: Icon(
                  //         Icons.email,
                  //       ),
                  //     ),
                  //   ),
                  // ),
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
                                  Provider.of<CadastrarProvider>(context,
                                          listen: false)
                                      .cadastrarFunction(
                                          _nomeController.text,
                                          _emailController.text,
                                          selectedItem,
                                          _repetirSenhaControler.text)
                                      .then((value) {
                                    if (value) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ProfilePage()),
                                      );
                                    } else {
                                      _senhaController.clear();
                                      _repetirSenhaControler.clear();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: const Text('Erro ao registar'),
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
                                backgroundColor:
                                    const Color.fromARGB(219, 7, 3, 72),
                              ),
                              child: const Text(
                                'Registrar',
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

class ListOfClass{
 final String id;
 final String classes;

 ListOfClass(this.id, this.classes);

 static List<ListOfClass> get allClass =>[
  ListOfClass('1', '8classe'),
  ListOfClass('2', '9classe'),
  ListOfClass('3', '10classe'),
  ListOfClass('4', '11classe'),
  ListOfClass('5', '12classe'),
 ];
}
