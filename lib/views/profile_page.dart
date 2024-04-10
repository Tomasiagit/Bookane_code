//import 'package:bookane/provider.dart/profile_provider.dart';
import 'package:bookane/views/subscricao_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
//import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  static const String routeName = '/ProfilePage';
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
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
          title: const Text('Perfil',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          // actions: [IconButton(onPressed: () {}, icon: const Icon())],
        ),
        body: Center(
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
                      image: DecorationImage(
                          image: AssetImage('assets/meuperfil2.jpeg'),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  height: 70,
                ),
                Card(
                  elevation: 2,
                  shadowColor: Colors.black,
                  child: ListTile(
                    //   leading: Icon(Icons.person),
                    title: Text(
                      'Nome',
                    ),
                    subtitle: Text(
                      'Tomasia Guambe',
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
                      'tomasiaguambe17@gmail.com',
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
                      '12-classe',
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
                      'Subcricao',
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
                            builder: (context) => const SubscricaoPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: const Color(0xFF0C60A0),
                  ),
                  child: Text(
                    'Pagar Subscricao',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        )
        // body: SingleChildScrollView(
        //   child: FutureBuilder(
        //     future: userProfile,
        //     builder: (context, snapshot) {

        //         if(snapshot.hasData){
        //            String classe = '';
        //            var userData = snapshot.data!;

        //            if(userData.classId! == '1'){
        //             classe = '8-classe';

        //            } else if(userData.classId! == '2' ){
        //              classe = '9-classe';

        //            }else if(userData.classId! == '3'){
        //              classe = '10-classe';

        //            }else if(userData.classId! == '4'){
        //              classe = '11-classe';

        //            }else {
        //              classe = '12-classe';

        //            }

        //            return Container(
        //       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        //       child: Column(
        //         children: [

        //           /// -- IMAGE
        //           Stack(
        //             children: [
        //               SizedBox(
        //                 width: 250,
        //                 height: 200,
        //                 child: ClipRRect(
        //                     borderRadius: BorderRadius.circular(100),
        //                     child: const Image(
        //                       image: AssetImage('assets/reader_girl.png'),

        //                     width: 100,
        //                     height: 300,)),
        //               ),

        //             ],
        //           ),
        //           Center(
        //             child: Container(
        //               decoration: BoxDecoration(
        //                 border: Border.all(color: const Color(0xFF0C60A0)),
        //                 borderRadius: BorderRadius.circular(10)

        //               ),

        //               width: 500,
        //               height: 350,
        //               child: Column(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //               children: [

        //                      Text('Nome', style: TextStyle(fontWeight: FontWeight.normal)),
        //                              const SizedBox(height: 5),
        //                             SizedBox(
        //               width: 300,
        //               height: 40,
        //               child: ElevatedButton(
        //                 onPressed: (){},
        //                 style: ElevatedButton.styleFrom(
        //                     backgroundColor: const Color(0xFF0C60A0), side: BorderSide.none, shape: const StadiumBorder()),
        //               child:  Text(userData.fullName!, style: TextStyle(color: Colors.white)),
        //               )
        //               ),
        //                const SizedBox(height: 20),

        //               const Text('Email', style: TextStyle(fontWeight: FontWeight.normal)),
        //               const SizedBox(height: 5),
        //                             SizedBox(
        //               width: 300,
        //               height: 40,
        //               child: ElevatedButton(
        //                 onPressed: (){},
        //                 // => Get.to(() => const UpdateProfileScreen()

        //                 style: ElevatedButton.styleFrom(
        //                     backgroundColor: const Color(0xFF0C60A0), side: BorderSide.none, shape: const StadiumBorder()),
        //               child: Text(userData.email!, style: TextStyle(color: Colors.white)),
        //               )
        //               ),
        //               const SizedBox(height: 20),
        //                Text('classe', style: TextStyle(fontWeight: FontWeight.normal)),
        //                             SizedBox(
        //               width: 300,
        //               child: ElevatedButton(
        //                 onPressed: (){},
        //                 // => Get.to(() => const UpdateProfileScreen()

        //                 style: ElevatedButton.styleFrom(
        //                     backgroundColor: Color(0xFF0C60A0), side: BorderSide.none, shape: const StadiumBorder()),
        //               child: Text(classe,

        //                style: TextStyle(color: Colors.white)),
        //               )
        //               ),

        //               ],
        //                             )
        //             ,),
        //           )

        //         ]),
        //       );

        //         }

        //        return const Center(
        //         child: CircularProgressIndicator(),
        //       );

        //     },

        //   ),
        //   ),
        );
  }
}
