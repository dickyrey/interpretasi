part of 'trending_article_watcher_bloc.dart';

@freezed
class TrendingArticleWatcherState with _$TrendingArticleWatcherState {
  const factory TrendingArticleWatcherState.initial() = _Initial;
  const factory TrendingArticleWatcherState.loading() = _Loading;
  const factory TrendingArticleWatcherState.error(String message) = _Error;
  const factory TrendingArticleWatcherState.loaded({
    required List<Article> articleList,
    required bool hasReachedMax,
  }) = _Loaded;
}
