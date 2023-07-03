import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/similar_books_view_list.dart';
import 'package:flutter/material.dart';

import 'book_actions.dart';
import 'custom_book_details_app_bar.dart';
import 'custom_book_image.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return CustomScrollView(slivers: [
      SliverFillRemaining(
        hasScrollBody: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomBookDetailsAppBar(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.2),
              child: const CustomBookImage(),
            ),
            const SizedBox(height: 40),
            Text("The Jungle Book", style: Styles.textStyleSp30),
            const SizedBox(height: 6),
            Text("Rudyard Kipling",
                style: Styles.textStyle18.copyWith(
                    color: Colors.white.withOpacity(0.7),
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500)),
            const SizedBox(height: 15),
            const BookRating(mainAxisAlignment: MainAxisAlignment.center),
            const SizedBox(height: 25),
            const BookActions(),
            const Expanded(child: SizedBox(height: 50)),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'You can also like',
                style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 16),
            const SimilarBooksListView(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    ]);
  }
}
