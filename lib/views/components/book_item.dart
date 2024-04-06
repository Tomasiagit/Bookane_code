import 'package:bookane/views/reading_page.dart';
import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  final String pdfpath;
  final String imagepath;
  final String bookTitle;
  const BookItem({
    super.key,
    required this.imagepath,
    required this.pdfpath,
    required this.bookTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 3,
        right: 3,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const ReadingPage(
                pdfPath: 'assets/filosofia12.pdf',
                //  pdfPath: pdfpath
              ),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(
                imagepath,
                fit: BoxFit.cover,
                // width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 2,
              ),
              child: Text(
                bookTitle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
