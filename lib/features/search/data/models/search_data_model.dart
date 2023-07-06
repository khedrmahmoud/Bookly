class SearchData {
  final String q;
  final String? filter;
  final String? sort;

  SearchData({required this.q, this.filter, this.sort});

  SearchData copyWith({
    String? filterSelection,
    String? sortSelection,
    String? text,
  }) {
    return SearchData(
      filter: filterSelection ?? filter,
      q: text ?? q,
      sort: sortSelection ?? sort,
    );
  }
}
