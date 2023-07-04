import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/models/book_model/image_links.dart';
import 'package:bookly/features/home/data/models/book_model/volume_info.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:flutter/material.dart';

import 'custom_search_filed.dart';

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
          Text("Search Result", style: Styles.textStyle18),
          SizedBox(height: 16),
          Expanded(child: SearchResultListView()),
        ],
      ),
    );
  }
}

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => const Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: BookListViewItem(
          book: BookModel(
              volumeInfo: VolumeInfo(
                  imageLinks: ImageLinks(smallThumbnail: '', thumbnail: ''))),
        ),
      ),
    );
  }
}
