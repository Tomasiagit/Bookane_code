// ignore_for_file: prefer_const_constructors

import 'package:bookane/models/book.dart';
import 'package:bookane/views/reading_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  final Book book;
  const BookItem({super.key, required this.book});

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
              builder: (context) => ReadingPage(
                pdfPath: book.bookPath,
                //  pdfPath: pdfpath
              ),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: CachedNetworkImage(
              fit: BoxFit.cover,
              // width: double.infinity,
              imageUrl: book.bookImage.toString(),
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(
                  color: Color(0xFF0C60A0),
                ),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            )),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 2,
              ),
              child: Text(
                book.bookName.toString(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
