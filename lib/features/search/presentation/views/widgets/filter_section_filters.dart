import 'package:bookly/features/search/presentation/view_models/filter_serach_selecion_cubit/filter_search_selection_cubit.dart';
import 'package:bookly/features/search/presentation/view_models/searched_books_cubit/searched_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'filter_selection_item.dart';

class FiltersSearchSelection extends StatelessWidget {
  const FiltersSearchSelection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<bool> selections = List.generate(5, (_) => false);
    return BlocProvider(
      create: (context) => FilterSearchSelectionCubit(),
      child:
          BlocBuilder<FilterSearchSelectionCubit, FilterSearchSelectionState>(
              builder: (context, state) {
        var filterSearchSelection = context.read<FilterSearchSelectionCubit>();
        return Column(
          children: [
            const Text('Filter'),
            SizedBox(
              height: 80,
              child: GridView.count(
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  childAspectRatio: 2.4,
                  padding: EdgeInsets.zero,
                  children: List.generate(
                      filterSearchSelection.filters.length,
                      (index) => FilterSelctionItem(
                            selected: selections[index],
                            text: filterSearchSelection.filters[index],
                            onSlected: (bool value) {
                              for (int i = 0; i < selections.length; i++) {
                                selections[i] =
                                    i != index ? false : !selections[index];
                              }
                              filterSearchSelection.selectFilter(index);
                              if (state is FilterSearchFiltersSelction) {
                                context.read<SearchedBooksCubit>().filter =
                                    selections[index] ? state.filter : '';
                              }
                            },
                          ))),
            )
          ],
        );
      }),
    );
  }
}
/*   onPressed: (int index) {
                for (int i = 0; i < selections.length; i++) {
                  selections[i] = i != index ? false : !selections[index];
                }
                filterSearchSelection.selectFilter(index);
                if (state is FilterSearchFiltersSelction) {
                  context.read<SearchedBooksCubit>().filter =
                      selections[index] ? state.filter : '';
                }
              },List.generate(
                  5,
                  (index) => FilterSelctionItem(
                      text: filterSearchSelection.filters[index])), */