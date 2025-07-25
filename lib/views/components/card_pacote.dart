import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/pacote.dart';
import '../payment_methot_page.dart';

class CardPacote extends StatelessWidget {
  final Pacote pacote;
  final int? idClasse;
  const CardPacote({super.key, required this.pacote, required this.idClasse});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: InkWell(
        onTap: () {

          if(idClasse ==null){
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Selecione a Classe"),
              ),
            );
          }else{
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => PaymentMethodPage(
                      duracao: pacote.duracao!,
                      valor: pacote.valor!,
                      idpacote: pacote.id!,
                      idclasse: idClasse!,
                    )));
          }


          print("PacodeID: ${pacote.id}");
        },
        child: Container(
          height: 100,
          width: 80,
          decoration: BoxDecoration(
            color: Color(0xD50B6394), // Cor de fundo do Container
            borderRadius: BorderRadius.circular(
                10.0), // Raio da borda do Contair
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
                        style: TextStyle(fontWeight: FontWeight.bold,
                        color: Colors.white),
                      ),
                      Text("${ pacote.valor}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
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
