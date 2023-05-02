import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfilePage extends StatefulWidget {
  static const String routeName = '/ProfilePage';
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    // var widthSize = MediaQuery.of(context).size.width;
    // var heightSize = MediaQuery.of(context).size.height;
    return Scaffold(
 appBar: AppBar(
       // leading: IconButton(onPressed: () {}),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 63, 4, 30),
        title:const  Text('Perfil', style: TextStyle(
          fontWeight: FontWeight.bold,
        )),
       // actions: [IconButton(onPressed: () {}, icon: const Icon())],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            children: [

              /// -- IMAGE
              Stack(
                children: [
                  SizedBox(
                    width: 250,
                    height: 200,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100), 
                        child: const Image(
                          image: AssetImage('assets/reader_girl.png'),
                          
                        width: 100,
                        height: 300,)),
                  ),
             
                ],
              ),
              

              /// -- BUTTON
              Center(
                child: Container(
                  //color: Colors.deepOrangeAccent,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color.fromARGB(255, 71, 20, 167)),
                    borderRadius: BorderRadius.circular(10)
                
                  ),
                  
                  width: 500,
                  height: 350,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                              
                        const Text('Nome', style: TextStyle(fontWeight: FontWeight.normal)),
                                 const SizedBox(height: 5),
                                SizedBox(
                  width: 300,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: (){},
                    // => Get.to(() => const UpdateProfileScreen()
                    
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 212, 87, 146), side: BorderSide.none, shape: const StadiumBorder()),
                  child: const Text('Tomasia Alberto Guambe', style: TextStyle(color: Colors.white)),
                  )
                  ),
                   const SizedBox(height: 20),
                              
                  const Text('Email', style: TextStyle(fontWeight: FontWeight.normal)),
                  const SizedBox(height: 5),
                                SizedBox(
                  width: 300,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: (){},
                    // => Get.to(() => const UpdateProfileScreen()
                    
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 212, 87, 146), side: BorderSide.none, shape: const StadiumBorder()),
                  child: const Text('tomasiaguambe17@gmail.com', style: TextStyle(color: Colors.white)),
                  )
                  ),
                  const SizedBox(height: 20),
                  const Text('Classe', style: TextStyle(fontWeight: FontWeight.normal)),
                                SizedBox(
                  width: 300,
                  child: ElevatedButton(
                    onPressed: (){},
                    // => Get.to(() => const UpdateProfileScreen()
                    
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 212, 87, 146), side: BorderSide.none, shape: const StadiumBorder()),
                  child: const Text('12Classe', style: TextStyle(color: Colors.white)),
                  )
                  ),
                              
                              
                  ],
                                )
                ,),
              )
          
            ]),
              // const SizedBox(height: 30),
              // const Divider(),
              // const SizedBox(height: 10),

              /// -- MENU
              // ProfileMenuWidget(title: "Settings", icon: LineAwesomeIcons.cog, onPress: () {}),
              // ProfileMenuWidget(title: "Billing Details", icon: LineAwesomeIcons.wallet, onPress: () {}),
              // ProfileMenuWidget(title: "User Management", icon: LineAwesomeIcons.user_check, onPress: () {}),
              // const Divider(),
              // const SizedBox(height: 10),
              // ProfileMenuWidget(
              //     title: "Logout",
              //     icon: Icons.logout,
              //     textColor: Colors.red,
              //     endIcon: false,
              //     onPress: () {
              //       Get.defaultDialog(
              //         title: "LOGOUT",
              //         titleStyle: const TextStyle(fontSize: 20),
              //         content: const Padding(
              //           padding: EdgeInsets.symmetric(vertical: 15.0),
              //           child: Text("Are you sure, you want to Logout?"),
              //         ),
              //         confirm: Expanded(
              //           child: ElevatedButton(
              //             onPressed: () {},
              //             //=> AuthenticationRepository.instance.logout(),
              //             style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent, side: BorderSide.none),
              //             child: const Text("Yes"),
              //           ),
              //         ),
              //         cancel: OutlinedButton(onPressed: () => {}, child: const Text("No")),
              //       );
              //     }),
        
          ),
        ),
      );


      // body: Column(
      //   //mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         children: [
      //           Container(
      //             width: 130,
      //             height: 130,
      //             decoration: BoxDecoration(
      //               shape: BoxShape.circle,
      //               border: Border.all(
      //                   width: 2, color: const Color.fromARGB(219, 7, 3, 72)),
      //               image: const DecorationImage(
      //                 image: AssetImage('assets/reader_girl.png'),
      //               ),
      //             ),
      //           ),
      //           const SizedBox(
      //             height: 20,
      //           ),
      //           const Text('Tomasia Alberto Guambe',
      //               style: TextStyle(
      //                 fontWeight: FontWeight.bold,
      //                 fontSize: 18,
      //               )),
      //           const SizedBox(
      //             height: 10,
      //           ),
      //           const Text('tomasiaguambe@gmail.com',
      //               style: TextStyle(
      //                 fontWeight: FontWeight.normal,
      //                 fontSize: 14,
      //               )),
      //         ],
      //       ),
      //     ),

      //     Expanded(
      //       flex: 3,
      //       child: Container(
      //         //width: ,
      //         height: heightSize / 3,
      //         decoration: const BoxDecoration(
      //             color: Color.fromARGB(99, 6, 3, 72),
      //             borderRadius: BorderRadius.only(
      //               //  topRight: Radius.circular(30),
      //                 topLeft: Radius.circular(30))),

      //         child: Column(
      //           children: [
      //             Row(
      //               children: const [
      //                 Text("Tomasia Alberto Guambe"),
      //               ],
      //             ),
      //             Row(
      //               children: const [Text("tomasiaguambe17@gmail.com")],
      //             ),
      //             Row(
      //               children: const [
      //                 Text('Tipo de User": Estudante'),
      //                 Text("classe: 8"),
      //               ],
      //             ),
      //           ],
      //         ),
      //       ),
      //     )
      //   ],
      // ),
      // resizeToAvoidBottomInset: false,
 //   );

  }
}
