part of 'user_article_drafted_watcher_bloc.dart';

@freezed
class UserArticleDraftedWatcherEvent with _$UserArticleDraftedWatcherEvent {
  const factory UserArticleDraftedWatcherEvent.fetch({
    required bool isRefresh,
  }) = _Fetch;
}
