part of 'like_article_watcher_bloc.dart';

@freezed
class LikeArticleWatcherEvent with _$LikeArticleWatcherEvent {
  const factory LikeArticleWatcherEvent.fetch(String id) = _Fetch;
  const factory LikeArticleWatcherEvent.likePressed(String id) = _LikePressed;
}
