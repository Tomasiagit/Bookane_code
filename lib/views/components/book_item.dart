import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
   final String? pdfpath;
  final String? imagepath;
  const BookItem({super.key, this.imagepath, this.pdfpath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Image.asset(
                  'assets/12-classe/filosofia12.jpg',
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Biologia',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
