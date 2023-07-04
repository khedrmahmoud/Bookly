import 'package:bookly/core/widgets/custom_buttom.dart';
import 'package:bookly/core/widgets/functions/launch_url.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BookActions extends StatelessWidget {
  const BookActions({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          const Expanded(
              child: CustomButton(
            text: '19.99\$',
            backgroundColor: Colors.white,
            textColor: Colors.black,
            borderRadius: BorderRadius.horizontal(left: Radius.circular(16)),
          )),
          Expanded(
              child: CustomButton(
            onPressed: () {
              launchCustomUrl(context, book.volumeInfo.previewLink ?? '');
            },
            text: getPreviewText(book),
            backgroundColor: const Color(0xffEF8262),
            textColor: Colors.white,
            fontSize: 16,
            borderRadius:
                const BorderRadius.horizontal(right: Radius.circular(16)),
          ))
        ],
      ),
    );
  }

  String getPreviewText(BookModel book) {
    if (book.volumeInfo.previewLink == null) {
      return "Not available";
    } else {
      return "Preview";
    }
  }
}
