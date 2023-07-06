import 'package:bookly/features/search/presentation/view_models/searched_books_cubit/searched_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_models/filter_search_cubit/filter_search_cubit.dart';
import 'filter_selection_item.dart';

class FiltersSearchSelection extends StatelessWidget {
  const FiltersSearchSelection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<bool> selections = List.generate(5, (_) => false);
    return BlocConsumer<FilterSearchCubit, FilterSearchState>(
        listener: (context, state) {
      if (state is FilterSearchFiltersSelction) {
        context.read<SearchedBooksCubit>().searchData = context
            .read<SearchedBooksCubit>()
            .searchData
            .copyWith(filterSelection: state.filter);
      }
    }, builder: (context, state) {
      var filterSearchSelection = context.read<FilterSearchCubit>();
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
                            filterSearchSelection.selectFilter(
                                index, selections[index]);
                          },
                        ))),
          )
        ],
      );
    });
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