enum ApiStatus { initial, loading, success, failure, refreshing }

mixin ApiStateMixin {
  ApiStatus get apiStatus;
  bool get isInitial => apiStatus == ApiStatus.initial;
  bool get isLoading => apiStatus == ApiStatus.loading;
  bool get isSuccess => apiStatus == ApiStatus.success;
  bool get isFailure => apiStatus == ApiStatus.failure;
  bool get isRefreshing => apiStatus == ApiStatus.refreshing;
}
