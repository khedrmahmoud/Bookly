import 'package:bookly/core/utils/common/colors.dart';
import 'package:bookly/features/search/presentation/view_models/filter_serach_selecion_cubit/filter_search_selection_cubit.dart';
import 'package:bookly/features/search/presentation/view_models/searched_books_cubit/searched_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Filter_selction_item.dart';

class FiltersSearchSelection extends StatelessWidget {
  const FiltersSearchSelection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<bool> selections = List.generate(3, (_) => false);
    return BlocProvider(
      create: (context) => FilterSearchSelectionCubit(),
      child:
          BlocBuilder<FilterSearchSelectionCubit, FilterSearchSelectionState>(
              builder: (context, state) {
        var filterSearchSelection = context.read<FilterSearchSelectionCubit>();
        return Column(
          children: [
            const Text('Filter'),
            ToggleButtons(
              selectedColor: ColorManager.orange,
              fillColor: Colors.transparent,
              renderBorder: false,
              isSelected: selections,
              onPressed: (int index) {
                for (int i = 0; i < selections.length; i++) {
                  selections[i] = i != index ? false : !selections[index];
                }
                filterSearchSelection.selectFilter(index);
                if (state is FilterSearchFiltersSelction) {
                  context.read<SearchedBooksCubit>().filter =
                      selections[index] ? state.filter : '';
                }
              },
              children: List.generate(
                  3,
                  (index) => FilterSelctionItem(
                      text: filterSearchSelection.filters[index])),
            )
          ],
        );
      }),
    );
  }
}
