part of 'published_watcher_bloc.dart';

@freezed
class PublishedWatcherState with _$PublishedWatcherState {
  const factory PublishedWatcherState.initial() = _Initial;
  const factory PublishedWatcherState.loading() = _Loading;
  const factory PublishedWatcherState.error(String message) = _Error;
  const factory PublishedWatcherState.loaded({
    required List<Article> articleList,
    required bool hasReachedMax,
  }) = _Loaded;
}
