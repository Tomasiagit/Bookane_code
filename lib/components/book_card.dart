import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BookCard extends StatefulWidget {
  const BookCard({super.key});

  @override
  State<BookCard> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 4.0),
              child: Image.asset(
                'assets/reader_girl.png',
              ),
            ),
            const Text("Portugues"),
            const Text("Editora"),
            IconButton(
              iconSize: 50,
              icon: const Icon(Icons.backpack),
              onPressed: () {
                // ...
              },
            )
          ],
        )
      ],
    );
  }
}
