import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

import 'books_details_section.dart';
import 'custom_book_details_app_bar.dart';
import 'similar_books_section.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.book});

  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverFillRemaining(
        hasScrollBody: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomBookDetailsAppBar(),
            BookDetailsSection(
              book: book,
            ),
            const Expanded(child: SizedBox(height: 50)),
            const SimilarBooksSection(),
          ],
        ),
      ),
    ]);
  }
}
