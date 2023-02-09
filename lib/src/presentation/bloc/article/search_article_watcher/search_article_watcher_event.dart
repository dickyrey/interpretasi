part of 'search_article_watcher_bloc.dart';

@freezed
class SearchArticleWatcherEvent with _$SearchArticleWatcherEvent {
  const factory SearchArticleWatcherEvent.search(String query) = _Search;
}
