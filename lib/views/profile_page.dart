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
        automaticallyImplyLeading: true,
        backgroundColor: const Color(0xFF0C60A0),
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
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFF0C60A0)),
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
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0C60A0), side: BorderSide.none, shape: const StadiumBorder()),
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
                        backgroundColor: const Color(0xFF0C60A0), side: BorderSide.none, shape: const StadiumBorder()),
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
                        backgroundColor: Color(0xFF0C60A0), side: BorderSide.none, shape: const StadiumBorder()),
                  child: const Text('12Classe', style: TextStyle(color: Colors.white)),
                  )
                  ),
                              
                              
                  ],
                                )
                ,),
              )
          
            ]),
          ),
        ),
      );
  }
}
