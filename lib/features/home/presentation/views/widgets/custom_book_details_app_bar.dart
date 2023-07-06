import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBookDetailsAppBar extends StatelessWidget {
  const CustomBookDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Icons.close)),
        /*  IconButton(
            iconSize: 20,
            padding: const EdgeInsets.all(0),
            onPressed: () {
              context.push(AppRouter.kSearchView);
            },
            icon: const Icon(
              FontAwesomeIcons.magnifyingGlass,
            )), */
      ],
    );
  }
}
