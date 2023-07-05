part of 'filter_search_selection_cubit.dart';

abstract class FilterSearchSelectionState extends Equatable {
  const FilterSearchSelectionState();

  @override
  List<Object> get props => [];
}

class FilterSearchSelectionInitial extends FilterSearchSelectionState {}

class FilterSearchSelectionLoading extends FilterSearchSelectionState {}

class FilterSearchFiltersSelction extends FilterSearchSelectionState {
  final String filter;
  const FilterSearchFiltersSelction(this.filter);
}

class FilterSearchSortingSelction extends FilterSearchSelectionState {
  final String sorting;
  const FilterSearchSortingSelction(this.sorting);
}
