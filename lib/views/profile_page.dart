//import 'package:bookane/provider.dart/profile_provider.dart';
import 'package:bookane/firebase_implementation/manager_user_data.dart';
import 'package:bookane/models/profile.dart';
import 'package:bookane/models/user_model.dart';
import 'package:bookane/pages/inicio.dart';
import 'package:bookane/provider.dart/user_provider.dart';
import 'package:bookane/views/subscricao_page.dart';
import 'package:bookane/views/tipo_subcricao.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

//import '../firebase_implementation/firebase_auth_services.dart';
//import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  static const String routeName = '/ProfilePage';
  //final String? uid;
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // ManagerUSerData _managerUSerData = ManagerUSerData();
  // FirebaseAuthService _firebaseAuthService = FirebaseAuthService();
  // UserModel _userModel = UserModel();
  final userProvider = UserProvider();
  late Future<Profile> futureprofile;
  bool isLoading = true;




  void initState() {
    super.initState();
    futureprofile = userProvider.getProfile();
    // _loadUserData();
  }

  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: const Text('Meu Perfil')),
  //     body: FutureBuilder<Profile>(
  //       future: futureprofile,
  //       builder: (context, snapshot) {
  //         if (snapshot.connectionState == ConnectionState.waiting) {
  //           return const Center(child: CircularProgressIndicator());
  //         } else if (snapshot.hasError) {
  //           return Center(
  //             child: Text('Erro: ${snapshot.error}'),
  //           );
  //         } else if (snapshot.hasData) {
  //           final profile = snapshot.data!;
  //           return Padding(
  //             padding: const EdgeInsets.all(16.0),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text('ID: ${profile.id}', style: TextStyle(fontSize: 18)),
  //                 SizedBox(height: 8),
  //                 Text('Nome: ${profile.name}', style: TextStyle(fontSize: 18)),
  //                 SizedBox(height: 8),
  //                 Text('Email: ${profile.email}', style: TextStyle(fontSize: 18)),
  //               ],
  //             ),
  //           );
  //         } else {
  //           return const Center(child: Text('Usuário não encontrado.'));
  //         }
  //       },
  //     ),
  //   );
  // }

  // Future<void> _loadUserData() async {
  //   UserModel? _userdata = await _firebaseAuthService.getUserProfile(widget.uid);
  //   setState(() {
  //     _userModel = _userdata!;
  //     isLoading = false;  // Para controlar o carregamento
  //   });
  // }

  // @override
  Widget build(BuildContext context) {
    // var userProfile = Provider.of<ProfileProvider>(context).getProfile();
    var widthSize = MediaQuery.of(context).size.width;
    var hightSize = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          // leading: IconButton(onPressed: () {}),
          centerTitle: true,
          automaticallyImplyLeading: true,
          backgroundColor: const Color(0xFF0C60A0),
            iconTheme: IconThemeData(
              color: Colors.white, //change your color here
            ),
          title: const Text('Perfil',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
            actions: [

              IconButton(
                icon: Icon(Icons.logout,
                  color: Colors.white,),
                onPressed: () {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Logout'),
                      content: const Text('Tem certeza que pretende sair da aplicação?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            //_managerUSerData.clearUserData();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Inicio()),
                            );

                          },
                          child: const Text('Sair'),
                        ),
                      ],
                    ),
                  );


                },
              ),

            ]
          // actions: [IconButton(onPressed: () {}, icon: const Icon())],
        ),
        body: FutureBuilder<Profile>(
          future: futureprofile,
          builder: (context, snapshot){

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            else if (snapshot.hasError) {
              return Center(child: Text('Erro: ${snapshot.error}'));
             // print(${snapshot.error);
            }else if (snapshot.hasData){
              final user = snapshot.data!;

              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        width: widthSize / 2,
                        height: hightSize / 4,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(26, 230, 95, 16),
                            border: Border.all(
                                width: 1, color: Color.fromARGB(255, 130, 129, 129)),
                            shape: BoxShape.circle,
                            //image: profile!.logo != nullC
                            image: const DecorationImage(
                                image: AssetImage('assets/meuperfil2.jpeg'),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      Card(
                        elevation: 2,
                        shadowColor: Colors.black,
                        child: ListTile(
                          //   leading: Icon(Icons.person),
                          title: Text(
                            'Nome: ',
                          ),
                          subtitle: Text(
                            //' ${_userModel?.nome}',
                            '${user.name}',
                            style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                          ),
                          //  trailing: Icon(Icons.more_vert),
                        ),
                      ),
                      Card(
                        elevation: 2,
                        shadowColor: Colors.black,
                        child: ListTile(
                          //   leading: Icon(Icons.person),
                          title: Text(
                            'Email',
                          ),
                          subtitle: Text(
                            // ' ${_userModel?.email}',
                            '${user.email}',
                            style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                          ),
                          //  trailing: Icon(Icons.more_vert),
                        ),
                      ),
                      Card(
                        elevation: 2,
                        shadowColor: Colors.black,
                        child: ListTile(
                          //   leading: Icon(Icons.person),
                          title: Text(
                            'Classe',

                          ),
                          subtitle: Text(
                            //  ' ${_userModel?.classe}',
                            '12 Classe',
                            style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                          ),
                          //  trailing: Icon(Icons.more_vert),
                        ),
                      ),
                      const Card(
                        elevation: 2,
                        shadowColor: Colors.black,
                        child: ListTile(
                          //   leading: Icon(Icons.person),
                          title: Text(
                            'Subscrição',
                          ),
                          subtitle: Text(
                            '6meses',
                            style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                          ),
                          //  trailing: Icon(Icons.more_vert),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const TipoSubcricao()));
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: const Color(0xFF0C60A0),
                        ),
                        child: Text(
                          'Pagar Subscrição',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              );

            } else {
              return const Center(child: Text('Usuário não encontrado.'));
            }




          }

        )
        // isLoading
        //     ? Center(child: CircularProgressIndicator())  // Exibe um loading enquanto carrega
        //     : _userModel == null
        //     ? Center(child: Text('Usuário não encontrado'))
        //     :


        );
  }





}
