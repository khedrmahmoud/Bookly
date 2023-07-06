import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'filter_search_selection_state.dart';

class FilterSearchSelectionCubit extends Cubit<FilterSearchSelectionState> {
  FilterSearchSelectionCubit() : super(FilterSearchSelectionInitial());

  List<String> filters = [
    'partial',
    'full',
    'free-ebooks',
    'paid-ebooks',
    'ebooks'
  ];
  List<String> sorting = ['relevance', 'newest'];

  void selectFilter(index) {
    emit(FilterSearchSelectionLoading());
    emit(FilterSearchFiltersSelction(filters[index]));
  }

  void selectSorting(index) {
    emit(FilterSearchSelectionLoading());
    emit(FilterSearchFiltersSelction(sorting[index]));
  }
}
