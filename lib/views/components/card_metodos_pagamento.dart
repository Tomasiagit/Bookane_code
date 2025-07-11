import 'package:bookane/views/form_pagamento.dart';
import 'package:flutter/material.dart';

import '../tipo_subcricao.dart';

class CardMetodosPagamento extends StatelessWidget {
  final String metodo;
  final Color color;
  final int valor;
  final String duracao;
  final int idPacote;
  final int idClasse;

  const CardMetodosPagamento({super.key, required this.metodo, required this.color, required this.valor, required this.duracao, required this.idPacote, required this.idClasse});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => FormPagamento(
                    valor: valor, duracao: duracao, classeid: idClasse, pacoteid: idPacote,)));
        },
        child: Container(
          height: 140,
          width: 140,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(
                10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
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
                      Text(
                        metodo,
                        textAlign: TextAlign.center,
                        style:
                        TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "$valor",
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
        ),
      ),
    );
  }
}
