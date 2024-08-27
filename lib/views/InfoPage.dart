import 'package:flutter/material.dart';


class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0C60A0),
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: const Text('Informação',
          style: TextStyle(
              color:Color(0xFFFFFFFF)
          ),),

      ),
      body: const SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Precisa de ajuda?',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFF0C60A0),
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Para quais quer esclarecimentos, entre em contacto com:',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Color.fromARGB(255, 14, 3, 3),
                  fontSize: 14,
                ),
              ),
              const Text(
                'Email: tomasiaguambe17@gmail.com',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Color.fromARGB(255, 14, 3, 3),
                  fontSize: 14,
                ),
              ),
              const Text(
                'Ou Ligue para: 84/87 900987',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Color.fromARGB(255, 14, 3, 3),
                  fontSize: 14,
                ),
              ),
        
            ],
        
          ),
        ),
      ),
    );
  }
}
