part of 'user_article_moderated_watcher_bloc.dart';

@freezed
class UserArticleModeratedWatcherState with _$UserArticleModeratedWatcherState {
   const factory UserArticleModeratedWatcherState({
    required RequestState state,
    required String message,
    required List<Article> articleList,
    required int? page,
    required int totalItem,
  }) = _UserArticleModeratedWatcherState;

  factory UserArticleModeratedWatcherState.initial() {
    return const UserArticleModeratedWatcherState(
      state: RequestState.empty,
      message: '',
      articleList: [],
      page: 1,
      totalItem: 5,
    );
  }
}
