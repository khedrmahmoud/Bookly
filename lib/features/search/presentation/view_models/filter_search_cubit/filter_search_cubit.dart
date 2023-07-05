import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'filter_search_state.dart';

class FilterSearchCubit extends Cubit<FilterSearchState> {
  FilterSearchCubit() : super(FilterSearchClose());

  void changeFilterSearchState(bool isClosed) {
    isClosed ? emit(FilterSearchOpen()) : emit(FilterSearchClose());
  }
}
