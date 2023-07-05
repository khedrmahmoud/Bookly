import 'package:bookly/core/utils/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_models/filter_search_cubit/filter_search_cubit.dart';
import 'filter_section_filters.dart';
import 'filter_section_sorting.dart';

class SearchFilterSection extends StatelessWidget {
  const SearchFilterSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterSearchCubit, FilterSearchState>(
      builder: (context, state) {
        return AnimatedCrossFade(
          excludeBottomFocus: false,
          firstChild: Container(
            height: 160,
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: ColorManager.wightOp4,
                borderRadius: BorderRadius.circular(12)),
            child: const Column(
              children: [FiltersSearchSelection(), SortingSearchSelection()],
            ),
          ),
          secondChild: const SizedBox(),
          crossFadeState: state is FilterSearchClose
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 100),
          reverseDuration: const Duration(milliseconds: 700),
        );
      },
    );
  }
}
