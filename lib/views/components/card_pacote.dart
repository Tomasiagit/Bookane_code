import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/pacote.dart';
import '../subscricao_page.dart';

class CardPacote extends StatelessWidget {
  final Pacote pacote;
  const CardPacote({super.key, required this.pacote});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => SubscricaoPage(
                    duracao: pacote.duracao!,
                    valor: pacote.valor!,
                  )));
        },
        child: Container(
          height: 140,
          width: 140,
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
          //color: Colors.white70,
          child:  Column(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Column(
                    children: [
                      Text("${pacote.duracao}",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("${ pacote.valor}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF01243D)),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
