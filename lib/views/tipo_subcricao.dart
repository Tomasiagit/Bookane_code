import 'package:flutter/material.dart';

class TipoSubcricao extends StatefulWidget {
  const TipoSubcricao({super.key});

  @override
  State<TipoSubcricao> createState() => _TipoSubcricaoState();
}

class _TipoSubcricaoState extends State<TipoSubcricao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF0C60A0),
          title: const Text(
            'Pacotes',
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
                    "Escolha a subcricao da sua preferencia",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              textAlign: TextAlign.center,
              "Uma classe",
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
                                  '1 Semestre',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '200Mts',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.yellow),
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
                                  'Anual',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '700Mts',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.yellow),
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
            SizedBox(
              height: 10,
            ),
            Text(
              textAlign: TextAlign.center,
              "Mais de uma Classe",
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
                                  '1 semestre',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '400Mts',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.yellow),
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
                                  '1 Anual',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '1000Mts',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.yellow),
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
