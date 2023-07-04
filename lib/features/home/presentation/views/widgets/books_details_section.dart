import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

import 'book_actions.dart';
import 'book_rating.dart';
import 'custom_book_image.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.2),
          child: const CustomBookImage(
            imageUrl:
                'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-674010.jpg&fm=jpg',
          ),
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
        const SizedBox(height: 30),
        const BookActions(),
      ],
    );
  }
}
