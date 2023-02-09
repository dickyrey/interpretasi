part of 'search_article_watcher_bloc.dart';

@freezed
class SearchArticleWatcherState with _$SearchArticleWatcherState {
  const factory SearchArticleWatcherState.initial() = _Initial;
  const factory SearchArticleWatcherState.loading() = _Loading;
  const factory SearchArticleWatcherState.error(String message) = _Error;
  const factory SearchArticleWatcherState.loaded(List<Article> articleList) = _Loaded;
}
