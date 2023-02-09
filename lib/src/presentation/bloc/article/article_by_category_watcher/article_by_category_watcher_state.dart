part of 'article_by_category_watcher_bloc.dart';

@freezed
class ArticleByCategoryWatcherState with _$ArticleByCategoryWatcherState {
  const factory ArticleByCategoryWatcherState({
    required RequestState state,
    required String message,
    required int index,
    required int selectedCategoryId,
    required List<Article> articleList,
  }) = _ArticleByCategoryWatcherState;

  factory ArticleByCategoryWatcherState.initial() {
    return const ArticleByCategoryWatcherState(
      state: RequestState.empty,
      message: '',
      index: 0,
      selectedCategoryId: 1,
      articleList: [],
    );
  }
}
