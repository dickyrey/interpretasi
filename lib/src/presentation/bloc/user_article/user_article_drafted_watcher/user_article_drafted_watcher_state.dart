part of 'user_article_drafted_watcher_bloc.dart';

@freezed
class UserArticleDraftedWatcherState with _$UserArticleDraftedWatcherState {
  const factory UserArticleDraftedWatcherState({
    required RequestState state,
    required String message,
    required List<Article> articleList,
    required int? page,
    required int totalItem,
  }) = _UserArticleDraftedWatcherState;

  factory UserArticleDraftedWatcherState.initial() {
    return const UserArticleDraftedWatcherState(
      state: RequestState.empty,
      message: '',
      articleList: [],
      page: 1,
      totalItem: 5,
    );
  }
}
