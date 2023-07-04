import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

import 'book_actions.dart';
import 'book_rating.dart';
import 'custom_book_image.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.2),
          child: CustomBookImage(
            imageUrl: book.volumeInfo.imageLinks.thumbnail,
          ),
        ),
        const SizedBox(height: 40),
        Text(book.volumeInfo.title ?? '',
            textAlign: TextAlign.center, style: Styles.textStyleSp30),
        const SizedBox(height: 6),
        Text(book.volumeInfo.authors?.first ?? '',
            style: Styles.textStyle18.copyWith(
                color: Colors.white.withOpacity(0.7),
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500)),
        const SizedBox(height: 15),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          count: book.volumeInfo.ratingsCount ?? 0,
          rating: book.volumeInfo.averageRating ?? 0,
        ),
        const SizedBox(height: 30),
        BookActions(
          book: book,
        ),
      ],
    );
  }
}
