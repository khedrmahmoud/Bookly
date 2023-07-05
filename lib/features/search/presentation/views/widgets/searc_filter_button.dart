import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../view_models/filter_search_cubit/filter_search_cubit.dart';

class SearchFilterButton extends StatelessWidget {
  const SearchFilterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          context.read<FilterSearchCubit>().changeFilterSearchState(
              context.read<FilterSearchCubit>().state is FilterSearchClose);
        },
        icon: const Icon(
          FontAwesomeIcons.filter,
          size: 16,
        ));
  }
}
