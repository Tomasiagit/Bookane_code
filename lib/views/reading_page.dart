import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ReadingPage extends StatefulWidget {
  static const String routeName = '/ReadingPage';
  const ReadingPage({super.key});

  @override
  State<ReadingPage> createState() => _ReadingPageState();
}

class _ReadingPageState extends State<ReadingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Leitura..."),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                children: const [
                  Text(
                      "Ao contrário da crença popular, o Lorem Ipsum não é simplesmente texto aleatório. Tem raízes numa peça de literatura clássica em Latim, de 45 AC, tornando-o com mais de 2000 anos. Richard McClintock, um professor de Latim no Colégio Hampden-Sydney, na Virgínia, procurou uma das palavras em Latim mais obscuras (consectetur) numa passagem Lorem Ipsum, e atravessando as cidades do mundo na literatura clássica, descobriu a sua origem. Lorem Ipsum vem das secções 1.10.32 e 1.10.33 do de Finibus Bonorum et Malorum (Os Extremos do Bem e do Mal), por Cícero, escrito a 45AC. Este livro é um tratado na teoria da ética, muito popular durante a Renascença. A primeira linha de Lorem Ipsum, Lorem ipsum dolor sit amet... aparece de uma linha na secção 1.10.32.do Lorem Ipsum usado desde os anos 1500 é reproduzido abaixo para os interessados. As secções 1.10.32 e 1.10.33 do de Finibus Bonorum et Malorum do Cícero também estão reproduzidos na sua forma original, acompanhados pela sua tradução em Inglês, versões da tradução de 1914 por H. Rackham. Ao contrário da crença popular, o Lorem Ipsum não é simplesmente texto aleatório. Tem raízes numa peça de literatura clássica em Latim, de 45 AC, tornando-o com mais de 2000 anos. Richard McClintock, um professor de Latim no Colégio Hampden-Sydney, na Virgínia, procurou uma das palavras em Latim mais obscuras (consectetur) numa passagem Lorem Ipsum, e atravessando as cidades do mundo na literatura clássica, descobriu a sua origem. Lorem Ipsum vem das secções 1.10.32 e 1.10.33 do de Finibus Bonorum et Malorum (Os Extremos do Bem e do Mal), por Cícero, escrito a 45AC. Este livro é um tratado na teoria da ética, muito popular durante a Renascença. A primeira linha de Lorem Ipsum, Lorem ipsum dolor sit amet... aparece de uma linha na secção 1.10.32.do Lorem Ipsum usado desde os anos 1500 é reproduzido abaixo para os interessados. As secções 1.10.32 e 1.10.33 do de Finibus Bonorum et Malorum do Cícero também estão reproduzidos na sua forma original, acompanhados pela sua tradução em Inglês, versões da tradução de 1914 por H. Rackham. Ao contrário da crença popular, o Lorem Ipsum não é simplesmente texto aleatório. Tem raízes numa peça de literatura clássica em Latim, de 45 AC, tornando-o com mais de 2000 anos. Richard McClintock, um professor de Latim no Colégio Hampden-Sydney, na Virgínia, procurou uma das palavras em Latim mais obscuras (consectetur) numa passagem Lorem Ipsum, e atravessando as cidades do mundo na literatura clássica, descobriu a sua origem. Lorem Ipsum vem das secções 1.10.32 e 1.10.33 do de Finibus Bonorum et Malorum (Os Extremos do Bem e do Mal), por Cícero, escrito a 45AC. Este livro é um tratado na teoria da ética, muito popular durante a Renascença. A primeira linha de Lorem Ipsum, Lorem ipsum dolor sit amet... aparece de uma linha na secção 1.10.32.do Lorem Ipsum usado desde os anos 1500 é reproduzido abaixo para os interessados. As secções 1.10.32 e 1.10.33 do de Finibus Bonorum et Malorum do Cícero também estão reproduzidos na sua forma original, acompanhados pela sua tradução em Inglês, versões da tradução de 1914 por H. Rackham."),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
