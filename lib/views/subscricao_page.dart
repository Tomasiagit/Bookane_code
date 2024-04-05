import 'package:bookane/views/tipo_subcricao.dart';
import 'package:flutter/material.dart';

class SubscricaoPage extends StatefulWidget {
  const SubscricaoPage({super.key});

  @override
  State<SubscricaoPage> createState() => _SubscricaoPageState();
}

class _SubscricaoPageState extends State<SubscricaoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF0C60A0),
          title: const Text(
            'Metodos de Subscricao',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(children: [
            Image.asset(
              'assets/garotos.png',
              height: 150,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    "Page uma subscricao para continuar a ler o seu livro em mãos",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TipoSubcricao()));
                    },
                    child: Container(
                      height: 140,
                      width: 140,
                      //color: Colors.white70,
                      child: Column(
                        //   crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Mpesa',
                                    textAlign: TextAlign.center,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red, // Cor de fundo do Container
                        borderRadius: BorderRadius.circular(
                            10.0), // Raio da borda do Container
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.grey.withOpacity(0.5), // Cor da sombra
                            spreadRadius: 5, // Espalhamento da sombra
                            blurRadius: 7, // Raio do desfoque da sombra
                            offset: Offset(0, 3), // Deslocamento da sombra
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 140,
                    width: 140,
                    //color: Colors.white70,
                    child: Column(
                      //   crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Emola',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      color:
                          Colors.deepOrangeAccent, // Cor de fundo do Container
                      borderRadius: BorderRadius.circular(
                          10.0), // Raio da borda do Container
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // Cor da sombra
                          spreadRadius: 5, // Espalhamento da sombra
                          blurRadius: 7, // Raio do desfoque da sombra
                          offset: Offset(0, 3), // Deslocamento da sombra
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 140,
                    width: 140,
                    //color: Colors.white70,
                    child: Column(
                      //   crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Column(
                              children: [
                                Text(
                                  'paypol',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent, // Cor de fundo do Container
                      borderRadius: BorderRadius.circular(
                          10.0), // Raio da borda do Container
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // Cor da sombra
                          spreadRadius: 5, // Espalhamento da sombra
                          blurRadius: 7, // Raio do desfoque da sombra
                          offset: Offset(0, 3), // Deslocamento da sombra
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 140,
                    width: 140,
                    //color: Colors.white70,
                    child: Column(
                      //   crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Transferencias Bancarias',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white, // Cor de fundo do Container
                      borderRadius: BorderRadius.circular(
                          10.0), // Raio da borda do Container
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // Cor da sombra
                          spreadRadius: 5, // Espalhamento da sombra
                          blurRadius: 7, // Raio do desfoque da sombra
                          offset: Offset(0, 3), // Deslocamento da sombra
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ));
  }
}
