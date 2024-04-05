import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
    static const String routeName = '/HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        automaticallyImplyLeading: false,
                centerTitle: true,
                backgroundColor:  const Color.fromARGB(255, 63, 4, 30),
      ),

      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20,),
            CarouselSlider(
              items: [
                Container(
                  margin: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: const DecorationImage(
                      image: AssetImage('assets/img_leitorb.png'),
                      fit: BoxFit.fitHeight,
                      )
                    )
                  ),
                   Container(
                  margin: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/img_livro.png',
                        ), 
                      fit: BoxFit.fitHeight,
                      )
                    )
                  ),
                   Container(
                  margin: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: const DecorationImage(
                      image: AssetImage('assets/leitor.png'),
                      fit: BoxFit.fitHeight,
                      )
                    )
                  ),
              ],
              options: CarouselOptions(
                height: 180,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16/9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                viewportFraction: 0.8,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
              ),
            ),
            const SizedBox(height: 10,),
            // const Text('Bem vindo a Bookane',
            // style: TextStyle(
            //   fontWeight: FontWeight.bold,
            //   fontSize: 18,
            // ),
            // ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Esta plataforma foi criada com intuito de facilitar o acesso a livros aos alunos do ensino secundario em Mocambique.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16,
                
              ),
              ),
            ),

             ElevatedButton(
                    onPressed: (){},
                    // => Get.to(() => const UpdateProfileScreen()
                    
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 212, 87, 146), side: BorderSide.none, shape: const StadiumBorder()),
                  child: const Text('Cadastre-se', style: TextStyle(color: Colors.white)),
                  ),
               const SizedBox(height: 20,),
                const Text('Encontre a sua Classe',
                textAlign: TextAlign.start,
                 style: TextStyle(color: Color.fromARGB(255, 14, 3, 3), fontSize: 14)),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          
                        },
                        child: Container(
                          height: 100,
                          width: 70,
                          margin: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.black,
                            ),
                            child: Column(
                              children:const [
                                SizedBox(height: 25,),
                                 Text('12',
                                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                                 Text('Classe',
                                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                      ),
                        const SizedBox(width: 10,),
                
                        Container(
                        height: 100,
                        width: 70,
                        margin: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.black,
                          ),
                          child: Column(
                            children:const [
                              SizedBox(height: 25,),
                               Text('11',
                              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                               Text('Classe',
                              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Container(
                    height: 100,
                    width: 70,
                    margin: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.black,
                      ),
                      child: Column(
                        children:const [
                          SizedBox(height: 25,),
                           Text('10',
                          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                           Text('Classe',
                          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10,),
                    
                    ],
                  ),
                ),
                const Text('Inicie a sua sessao',
                textAlign: TextAlign.start,
                 style: TextStyle(color: Color.fromARGB(255, 14, 3, 3), fontSize: 14,)),
                ElevatedButton(
                    onPressed: (){},
                    // => Get.to(() => const UpdateProfileScreen()
                    
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 212, 87, 146), side: BorderSide.none, shape: const StadiumBorder()),
                  child: const Text('Login', style: TextStyle(color: Colors.white)),
                  ),

             
                  

          ],
        ),
        
      ),
    );
  }
}