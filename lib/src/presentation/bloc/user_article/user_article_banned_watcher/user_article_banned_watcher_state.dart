part of 'user_article_banned_watcher_bloc.dart';

@freezed
class UserArticleBannedWatcherState with _$UserArticleBannedWatcherState {
  const factory UserArticleBannedWatcherState({
    required RequestState state,
    required String message,
    required List<Article> articleList,
    required int? page,
    required int totalItem,
  }) = _UserArticleBannedWatcherState;

  factory UserArticleBannedWatcherState.initial() {
    return const UserArticleBannedWatcherState(
      state: RequestState.empty,
      message: '',
      articleList: [],
      page: 1,
      totalItem: 5,
    );
  }
}
