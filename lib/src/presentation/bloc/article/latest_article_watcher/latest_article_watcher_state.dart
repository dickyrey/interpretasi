part of 'latest_article_watcher_bloc.dart';

@freezed
class LatestArticleWatcherState with _$LatestArticleWatcherState {
  const factory LatestArticleWatcherState.initial() = _Initial;
  const factory LatestArticleWatcherState.loading() = _Loading;
  const factory LatestArticleWatcherState.error(String message) = _Error;
  const factory LatestArticleWatcherState.loaded({
    required List<Article> articleList,
    required bool hasReachedMax,
  }) = _Loaded;
}
