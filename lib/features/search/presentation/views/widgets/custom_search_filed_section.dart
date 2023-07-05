import 'package:bookly/features/search/presentation/view_models/searched_books_cubit/searched_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'searc_filter_button.dart';

class CustomSerachTextField extends StatelessWidget {
  const CustomSerachTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextField(
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        onChanged: (value) {
          context.read<SearchedBooksCubit>().q = value;
        },
        onSubmitted: (value) {
          context.read<SearchedBooksCubit>().searchAboutBook();
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white.withOpacity(0.25),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(20)),
          hintText: 'Search',
          suffixIcon: const SearchFilterButton(),
          prefixIcon: IconButton(
              onPressed: () {
                context.read<SearchedBooksCubit>().searchAboutBook();
              },
              icon: const Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: 16,
              )),
        ),
      ),
    );
  }
}
