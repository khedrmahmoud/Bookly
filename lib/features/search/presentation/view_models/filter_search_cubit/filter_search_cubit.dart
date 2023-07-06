import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'filter_search_state.dart';

class FilterSearchCubit extends Cubit<FilterSearchState> {
  FilterSearchCubit() : super(FilterSearchClose());

  List<String> filters = [
    'partial',
    'full',
    'free-ebooks',
    'paid-ebooks',
    'ebooks'
  ];
  List<String> sorting = ['relevance', 'newest'];

  void selectFilter(int index, bool selected) {
    emit(FilterSearchSelectionLoading());
    emit(FilterSearchFiltersSelction(selected ? filters[index] : ''));
  }

  void selectSorting(int index, bool selected) {
    emit(FilterSearchSelectionLoading());
    emit(FilterSearchSortingSelction(selected ? sorting[index] : ''));
  }

  void changeFilterSearchState(bool isClosed) {
    isClosed ? emit(FilterSearchOpen()) : emit(FilterSearchClose());
  }
}
