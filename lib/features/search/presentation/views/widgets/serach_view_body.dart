import 'package:flutter/material.dart';

import 'custom_search_filed.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
      child: Column(
        children: [
          CustomSerachTextField(),
        ],
      ),
    );
  }
}
