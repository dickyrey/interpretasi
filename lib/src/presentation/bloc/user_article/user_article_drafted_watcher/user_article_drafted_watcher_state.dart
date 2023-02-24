part of 'user_article_drafted_watcher_bloc.dart';

@freezed
class UserArticleDraftedWatcherState with _$UserArticleDraftedWatcherState {
  const factory UserArticleDraftedWatcherState.initial() = _Initial;
  const factory UserArticleDraftedWatcherState.loading() = _Loading;
  const factory UserArticleDraftedWatcherState.error(String message) = _Error;
  const factory UserArticleDraftedWatcherState.loaded({
    required List<Article> articleList,
    required bool hasReachedMax,
  }) = _Loaded;
}
