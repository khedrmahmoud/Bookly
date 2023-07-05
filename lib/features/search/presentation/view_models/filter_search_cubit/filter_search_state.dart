part of 'filter_search_cubit.dart';

abstract class FilterSearchState extends Equatable {
  const FilterSearchState();

  @override
  List<Object> get props => [];
}

class FilterSearchInitial extends FilterSearchState {}

class FilterSearchOpen extends FilterSearchState {}

class FilterSearchClose extends FilterSearchState {}
