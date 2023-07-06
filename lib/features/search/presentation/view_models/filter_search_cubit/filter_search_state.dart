part of 'filter_search_cubit.dart';

abstract class FilterSearchState extends Equatable {
  const FilterSearchState();

  @override
  List<Object> get props => [];
}

class FilterSearchInitial extends FilterSearchState {}

class FilterSearchOpen extends FilterSearchState {}

class FilterSearchClose extends FilterSearchState {}

class FilterSearchSelectionLoading extends FilterSearchState {}

class FilterSearchFiltersSelction extends FilterSearchState {
  final String? filter;
  const FilterSearchFiltersSelction(this.filter);
}

class FilterSearchSortingSelction extends FilterSearchState {
  final String? sorting;
  const FilterSearchSortingSelction(this.sorting);
}
