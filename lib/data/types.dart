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

class ApiResponse<T> {
  final bool success;
  final T? data;
  final ApiError? error;

  ApiResponse({required this.success, required this.data, required this.error});

  factory ApiResponse.fromJson(
      Map<String, dynamic> json, T Function(dynamic) bodyDecode) {
    return ApiResponse(
      success: json['success'],
      data: json['data'] != null ? bodyDecode(json['data']) : null,
      error: json['error'] != null ? ApiError.fromJson(json['error']) : null,
    );
  }
}

class ApiError {
  final String message;
  final String reason;

  ApiError({required this.message, required this.reason});

  factory ApiError.fromJson(Map<String, dynamic> json) {
    return ApiError(
      message: json['message'],
      reason: json['reason'],
    );
  }
}
