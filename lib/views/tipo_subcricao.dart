import 'package:bookane/provider.dart/payment_provider.dart';
import 'package:bookane/views/components/card_pacote.dart';
import 'package:bookane/views/subscricao_page.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../models/pacote.dart';

class TipoSubcricao extends StatefulWidget {
  // final String duracao;
  // final String valor;
  const TipoSubcricao({super.key});

  @override
  State<TipoSubcricao> createState() => _TipoSubcricaoState();
}

class _TipoSubcricaoState extends State<TipoSubcricao> {
  @override

  final payPrivider = PaymentsProvider();
  late Future<List<Pacote>> _pacote;

  void initState() {
    super.initState();
    _pacote = payPrivider.fetchPacotes();
  }

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
                    "Escolha o Pacote para a sua Subscrição",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),


                  Expanded(
              
                    child: FutureBuilder<List<Pacote>>(future: _pacote , builder: (context, snapshot) {
              
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: LoadingAnimationWidget.waveDots(
                              color: Color.fromARGB(255, 254, 207, 0), size: 70),
                        );
                      } else if (snapshot.hasError) {
                        return Center(child: Text("Erro: ${snapshot.error}"));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(child: Text("Nenhum pacote disponível."));
                      }

                      final pacotes = snapshot.data!;
                      return GridView.builder(
                        itemCount: pacotes.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, //
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 3 / 2, // Adjust height/width of cards
                        ),
                        itemBuilder: (context, index) {
                          return CardPacote(pacote: pacotes[index]);
                        },
                      );
                      // return ListView.builder(
                      //   itemCount: pacotes.length,
                      //   itemBuilder: (context, index) {
                      //     return CardPacote(pacote: pacotes[index]);
                      //   },
                      // );
              
                    }),
                  ),



            // const Row(
            //   children: [
            //     Pacotes(preco: "100 mts", duracao: "1 Mês"),
            //     Pacotes(preco: "250 mts", duracao: "1 Trimestre"),
            //   ],
            // ),
            //
           // const  Text(
           //    textAlign: TextAlign.center,
           //    "Mais de uma Classe",
           //  ),

          ]),
        ));
  }
}
