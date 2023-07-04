import 'package:bookly/core/widgets/custom_errore_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/features/home/presentation/view_model/newset_books_cubit/newset_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'book_list_view_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsetBooksCubit, NewsetBooksState>(
      builder: (context, state) {
        if (state is NewsetBooksSuccess) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.books.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: BookListViewItem(
                book: state.books[index],
              ),
            ),
          );
        } else if (state is NewsetBooksFailure) {
          return CustomErrorWidget(errorMessage: state.message);
        } else {
          return const CustomLoadingIndicar();
        }
      },
    );
  }
}
