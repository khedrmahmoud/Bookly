import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_models/filter_serach_selecion_cubit/filter_search_selection_cubit.dart';
import '../../view_models/searched_books_cubit/searched_books_cubit.dart';
import 'filter_selection_item.dart';

class SortingSearchSelection extends StatelessWidget {
  const SortingSearchSelection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<bool> selections = List.generate(2, (_) => false);

    return BlocProvider(
      create: (context) => FilterSearchSelectionCubit(),
      child:
          BlocBuilder<FilterSearchSelectionCubit, FilterSearchSelectionState>(
        builder: (context, state) {
          var filterSearchSelection =
              context.read<FilterSearchSelectionCubit>();
          return Flexible(
            child: Column(
              children: [
                const Text('Sorting'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                      filterSearchSelection.sorting.length,
                      (index) => FilterSelctionItem(
                            text: filterSearchSelection.sorting[index],
                            selected: selections[index],
                            onSlected: (bool value) {
                              for (int i = 0; i < selections.length; i++) {
                                selections[i] =
                                    i != index ? false : !selections[index];
                              }
                              filterSearchSelection.selectFilter(index);
                              if (state is FilterSearchSortingSelction) {
                                context.read<SearchedBooksCubit>().sort =
                                    selections[index] ? state.sorting : '';
                              }
                            },
                          )),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
