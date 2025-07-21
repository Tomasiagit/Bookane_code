import 'package:bookane/provider.dart/payment_provider.dart';
import 'package:bookane/views/components/card_classe.dart';
import 'package:bookane/views/components/card_pacote.dart';
import 'package:bookane/views/payment_methot_page.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../models/classe.dart';
import '../models/pacote.dart';
import 'components/Radio_classes.dart';

class TipoSubcricao extends StatefulWidget {
  // final String duracao;
  // final String valor;
  const TipoSubcricao({super.key});

  @override
  State<TipoSubcricao> createState() => _TipoSubcricaoState();
}
enum SingingCharacter { lafayette, jefferson }
class _TipoSubcricaoState extends State<TipoSubcricao> {
  @override

  final payPrivider = PaymentsProvider();
  late Future<List<Pacote>> _pacote;
  late Future<List<Classe>> _classe;
  int? _selectedClasseId;

  void initState() {
    super.initState();
    _pacote = payPrivider.fetchPacotes();
    _classe = payPrivider.fetchClasses();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF0C60A0),
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          title: const Text(
            'Escolha o Seu Pacote',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(children: [
            Text(
              textAlign: TextAlign.center,
              "Escolha o pacote para a sua Subscrição",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Expanded(child:
            FutureBuilder<List<Classe>>(future:  _classe , builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: LoadingAnimationWidget.waveDots(
                      color: Color.fromARGB(255, 254, 207, 0), size: 70),
                );
              } else if (snapshot.hasError) {
                return Center(child: Text("Erro: ${snapshot.error}"));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text("Nenhum classe disponível."));
              }
              final cl = snapshot.data ?? [];
              return GridView.builder(
                itemCount: cl.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 3,
                  mainAxisSpacing: 3,
                  childAspectRatio: 9 / 3,
                ),
                itemBuilder: (context, index) {
                  return RadioClasses(
                    clas: cl[index],
                    selectedId: _selectedClasseId,
                    onSelected: (id) {
                      setState(() {
                        _selectedClasseId = id;
                        print("iddd classe:${_selectedClasseId}");
                      });

                    },


                  );
                },
              );
            }
            ),
            ),
          const Padding(
              padding: const EdgeInsets.all(4.0),
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
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 10,
                          childAspectRatio: 3 / 2, // Adjust height/width of cards
                        ),
                        itemBuilder: (context, index) {

                          return CardPacote(pacote: pacotes[index], idClasse:_selectedClasseId, );

                        },
                      );

                    }
                    ),
                  ),
          ]),
        ));
  }
}
