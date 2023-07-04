import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating(
      {super.key,
      this.mainAxisAlignment = MainAxisAlignment.start,
      required this.rating,
      required this.count});
  final int rating;
  final int count;
  final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4f),
          size: 14,
        ),
        const SizedBox(width: 6.3),
        Text(
          '$rating',
          style: Styles.textStyle16,
        ),
        const SizedBox(width: 5),
        Text(
          '($count)',
          style:
              Styles.textStyle14.copyWith(color: Colors.white.withOpacity(0.5)),
        ),
      ],
    );
  }
}
