import 'package:bookly/core/utils/styles.dart';

import 'package:flutter/material.dart';

import 'custom_search_filed_section.dart';
import 'search_filter_section.dart';
import 'search_result_section.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSerachTextField(),
          SizedBox(height: 16),
          SearchFilterSection(),
          SizedBox(height: 16),
          Text("Search Result", style: Styles.textStyle18),
          SizedBox(height: 16),
          Expanded(child: SearchResultListView()),
        ],
      ),
    );
  }
}
