part of 'rejected_watcher_bloc.dart';

@freezed
class RejectedWatcherState with _$RejectedWatcherState {
  const factory RejectedWatcherState.initial() = _Initial;
  const factory RejectedWatcherState.loading() = _Loading;
  const factory RejectedWatcherState.error(String message) = _Error;
  const factory RejectedWatcherState.loaded({
    required List<Article> articleList,
    required bool hasReachedMax,
  }) = _Loaded;
}
