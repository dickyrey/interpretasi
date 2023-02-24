part of 'latest_article_watcher_bloc.dart';

@freezed
class LatestArticleWatcherEvent with _$LatestArticleWatcherEvent {
  const factory LatestArticleWatcherEvent.fetch({
    required bool isRefresh,
  }) = _Fetch;
}
