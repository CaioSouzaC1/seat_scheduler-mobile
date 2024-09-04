class Meta {
  final int total;
  final int perPage;
  final int? currentPage;
  final int lastPage;
  final int firstPage;
  final String firstPageUrl;
  final String lastPageUrl;
  final String? nextPageUrl;
  final String? previousPageUrl;

  Meta(
      {required this.total,
      required this.perPage,
      this.currentPage,
      required this.lastPage,
      required this.firstPage,
      required this.firstPageUrl,
      required this.lastPageUrl,
      this.nextPageUrl,
      this.previousPageUrl});

  Map<String, dynamic> toMap() {
    return {
      'total': total,
      'perPage': perPage,
      'currentPage': currentPage,
      'lastPage': lastPage,
      'firstPage': firstPage,
      'firstPageUrl': firstPageUrl,
      'lastPageUrl': lastPageUrl,
      'previousPageUrl': previousPageUrl
    };
  }

  factory Meta.fromMap(Map<String, dynamic> map) {
    return Meta(
        total: map['total'],
        perPage: map['perPage'],
        currentPage: map['currentPage'],
        lastPage: map['lastPage'],
        firstPage: map['firstPage'],
        firstPageUrl: map['firstPageUrl'],
        lastPageUrl: map['lastPageUrl'],
        nextPageUrl: map['nextPageUrl'],
        previousPageUrl: map['previousPageUrl']);
  }
}

class ApiPaginateRoot<T> {
  final bool error;
  final String message;
  final Meta meta;
  final List<T> data;

  ApiPaginateRoot(
      {required this.error,
      required this.message,
      required this.meta,
      required this.data});

  factory ApiPaginateRoot.fromMap(
      Map<String, dynamic> map, T Function(Map<String, dynamic>) fromMap) {
    return ApiPaginateRoot(
      error: map['error'],
      message: map['message'],
      meta: Meta.fromMap(map['data']['meta']),
      data: map['data']['data'] != null
          ? (map['data']['data'] as List).map((data) => fromMap(data)).toList()
          : [],
    );
  }
}
