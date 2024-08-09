import 'dart:convert';

class ApiRoot<T> {
  final bool error;
  final String message;
  final T data;

  ApiRoot({
    required this.error,
    required this.message,
    required this.data,
  });

  Map<String, dynamic> toMap() {
    return {'id': error, 'message': message, 'data': data};
  }

  factory ApiRoot.fromMap(Map<String, dynamic> map) {
    return ApiRoot(
        error: map["error"], message: map["message"], data: map["data"]);
  }

  factory ApiRoot.fromJson(String source) =>
      ApiRoot.fromMap(json.decode(source));
}
