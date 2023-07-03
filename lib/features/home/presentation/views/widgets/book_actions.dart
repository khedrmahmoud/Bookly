import 'package:bookly/core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';

class BookActions extends StatelessWidget {
  const BookActions({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Expanded(
              child: CustomButton(
            text: '19.99\$',
            backgroundColor: Colors.white,
            textColor: Colors.black,
            borderRadius: BorderRadius.horizontal(left: Radius.circular(16)),
          )),
          Expanded(
              child: CustomButton(
            text: 'Free preview',
            backgroundColor: Color(0xffEF8262),
            textColor: Colors.white,
            fontSize: 16,
            borderRadius: BorderRadius.horizontal(right: Radius.circular(16)),
          ))
        ],
      ),
    );
  }
}
