import 'package:bookly/core/utils/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_models/filter_serach_selecion_cubit/filter_search_selection_cubit.dart';
import '../../view_models/searched_books_cubit/searched_books_cubit.dart';
import 'Filter_selction_item.dart';

class SortingSearchSelection extends StatelessWidget {
  const SortingSearchSelection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<bool> selections = List.generate(1, (_) => false);

    return BlocProvider(
      create: (context) => FilterSearchSelectionCubit(),
      child:
          BlocBuilder<FilterSearchSelectionCubit, FilterSearchSelectionState>(
        builder: (context, state) {
          var filterSearchSelection =
              context.read<FilterSearchSelectionCubit>();
          return Column(
            children: [
              const Text('Sorting'),
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
                  if (state is FilterSearchSortingSelction) {
                    context.read<SearchedBooksCubit>().sort =
                        selections[index] ? state.sorting : '';
                  }
                },
                children: List.generate(
                    1,
                    (index) => FilterSelctionItem(
                        text: filterSearchSelection.sorting[index])),
              )
            ],
          );
        },
      ),
    );
  }
}
