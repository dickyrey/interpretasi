part of 'trending_article_watcher_bloc.dart';

@freezed
class TrendingArticleWatcherEvent with _$TrendingArticleWatcherEvent {
  const factory TrendingArticleWatcherEvent.fetch({
    required bool isRefresh,
  }) = _Fetch;
}
