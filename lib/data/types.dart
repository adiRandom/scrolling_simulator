class PaginatedData<T> {
  final int page;
  final int perPage;
  final int total;
  final int totalPages;
  final List<T> data;

  PaginatedData(
      {required this.page,
      required this.perPage,
      required this.total,
      required this.totalPages,
      required this.data});
}
