class Constant {
  static const kBOXResult = "resultsbox";
  static const kBOXResulListtModel = "resultlistsbox";
  static const String kHiveRoutineBox = "resultItem";
  static const String kHiveNoteBox = "noteModel";

  static Future<AsyncValue<T>> handleFuture<T>(Future<T> future) {
    return future.then((value) {
      return AsyncValue<T>._().copyWith(data: value);
    }).catchError((error) {
      return AsyncValue<T>._().copyWith(error: error);
    });
  }
}

class AsyncValue<T> {
  final T? data;
  final String? error;
  AsyncValue({
    this.data,
    this.error,
  });
  AsyncValue._()
      : data = null,
        error = null;

  bool get isSuccess => data != null;
  bool get isError => error != null;
  bool get isLoading => !isSuccess && !isError;
  AsyncValue<T> copyWith({
    bool? isLoading,
    T? data,
    String? error,
  }) {
    return AsyncValue<T>(
      data: data ?? this.data,
      error: error ?? this.error,
    );
  }
}
