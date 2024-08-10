class ApiRoot<T> {
  final bool error;
  final String message;
  final T data;
  final String? token;

  ApiRoot(
      {required this.error,
      required this.message,
      required this.data,
      this.token});

  factory ApiRoot.fromMap(
      Map<String, dynamic> map, T Function(Map<String, dynamic>) fromMap) {
    return ApiRoot(
        error: map["error"],
        message: map["message"],
        data: fromMap(map['data']),
        token: map['data']['token'] ?? '');
  }
}
