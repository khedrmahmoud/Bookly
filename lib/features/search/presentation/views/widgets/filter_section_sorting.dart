import 'package:bookly/features/search/presentation/view_models/filter_search_cubit/filter_search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_models/searched_books_cubit/searched_books_cubit.dart';
import 'filter_selection_item.dart';

class SortingSearchSelection extends StatelessWidget {
  const SortingSearchSelection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<bool> selections = List.generate(2, (_) => false);

    return BlocConsumer<FilterSearchCubit, FilterSearchState>(
      listener: (context, state) {
        if (state is FilterSearchSortingSelction) {
          context.read<SearchedBooksCubit>().searchData = context
              .read<SearchedBooksCubit>()
              .searchData
              .copyWith(sortSelection: state.sorting);
        }
      },
      builder: (context, state) {
        var filterSearchSelection = context.read<FilterSearchCubit>();
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
                            filterSearchSelection.selectSorting(
                                index, selections[index]);
                          },
                        )),
              )
            ],
          ),
        );
      },
    );
  }
}
