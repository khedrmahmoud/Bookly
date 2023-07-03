import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: Container(
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: NetworkImage(
                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
