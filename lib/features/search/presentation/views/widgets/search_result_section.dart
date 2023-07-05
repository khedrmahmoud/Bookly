import 'package:bookly/core/widgets/custom_errore_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/core/widgets/book_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_models/searched_books_cubit/searched_books_cubit.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchedBooksCubit, SearchedBooksState>(
      builder: (context, state) {
        if (state is SearchedBooksSuccess) {
          return ListView.builder(
            itemCount: state.books.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: BookListViewItem(
                book: state.books[index],
              ),
            ),
          );
        } else if (state is SearchedBooksFailure) {
          return CustomErrorWidget(errorMessage: state.message);
        } else if (state is SearchedBooksLoading) {
          return const CustomLoadingIndicar();
        } else {
          return const CustomErrorWidget(errorMessage: "Empty List");
        }
      },
    );
  }
}
