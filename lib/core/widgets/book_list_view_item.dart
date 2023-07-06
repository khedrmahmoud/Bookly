import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/views/widgets/book_rating.dart';
import '../utils/functions/get_book_price.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        context.push(AppRouter.kBookDetailsView, extra: book);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            CustomBookImage(imageUrl: book.volumeInfo.imageLinks.thumbnail),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: width * .5,
                    child: Text(
                      book.volumeInfo.title ?? 'No Title',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyleSp20,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    book.volumeInfo.authors?.first ?? '',
                    style: Styles.textStyle14,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 3),
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          getPriceText(book, context),
                          style: Styles.textStyle20
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        BookRating(
                          count: book.volumeInfo.ratingsCount ?? 0,
                          rating: book.volumeInfo.averageRating ?? 0,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
