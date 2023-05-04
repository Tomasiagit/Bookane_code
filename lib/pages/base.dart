import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Base extends StatelessWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0C60A0),
        title: Text('Bookane'),
      ),
      body: SizedBox.expand(
        child: Column(
          children: [
            Text('data'),
          ],
        ),
      ),
    );
  }
}
