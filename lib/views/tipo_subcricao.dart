import 'package:bookane/views/components/pacotes.dart';
import 'package:bookane/views/subscricao_page.dart';
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
          iconTheme: const IconThemeData(
            color: Colors.white, //change your color here
          ),
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
         const Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    "Escolha a subcrição da sua preferencia",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // const Text(
            //   textAlign: TextAlign.center,
            //   "Uma classe",
            // ),
            const Row(
              children: [
                Pacotes(preco: "100 mts", duracao: "1 Mês"),
                Pacotes(preco: "250 mts", duracao: "1 Trimestre"),
              ],
            ),
           const SizedBox(
              height: 10,
            ),
           // const  Text(
           //    textAlign: TextAlign.center,
           //    "Mais de uma Classe",
           //  ),
            const Row(
              children: [
                Pacotes(preco: "750 mts", duracao: "1 Semestre"),
                Pacotes(preco: "1500 mts", duracao: "1 Ano"),
              ],
            ),
          ]),
        ));
  }
}
