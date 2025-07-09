import 'package:bookane/views/tipo_subcricao.dart';
import 'package:flutter/material.dart';

import 'components/metodos_pagamento.dart';

class SubscricaoPage extends StatefulWidget {
  final String duracao;
  final int valor;
  const SubscricaoPage({super.key, required this.duracao, required this.valor});

  @override
  State<SubscricaoPage> createState() => _SubscricaoPageState();
}

class _SubscricaoPageState extends State<SubscricaoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF0C60A0),
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          title: const Text(
            'Metodos de Pagamento',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          leading: BackButton(
            color: Color(0xFFFFFFFF),
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TipoSubcricao()));

             // print("back clic");
            },
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
                    "Page ${widget.valor} uma subscrição para continuar a ter o seu livro em mãos",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
             Row(
              children: [
                Metodos_Pagamento(metodo: "Mpesa", color:Colors.red, valor: widget.valor, duracao: widget.duracao),
                Metodos_Pagamento(metodo: "Emola", color:Colors.orange, valor: widget.valor, duracao: widget.duracao),

              ],
            ),
           const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Metodos_Pagamento(metodo: "Transferencias Bancarias", color:Colors.white, valor: widget.valor, duracao: widget.duracao),
                Metodos_Pagamento(metodo: "paypol", color:Colors.blue, valor: widget.valor, duracao: widget.duracao),


              ],
            ),
          ]),
        ));
  }
}
