part of 'article_comment_watcher_bloc.dart';

@freezed
class ArticleCommentWatcherEvent with _$ArticleCommentWatcherEvent {
  const factory ArticleCommentWatcherEvent.fetch(String id) = _Fetch;
  const factory ArticleCommentWatcherEvent.refresh(String id) = _Refresh;
}
