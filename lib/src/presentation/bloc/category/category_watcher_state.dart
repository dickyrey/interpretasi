part of 'category_watcher_bloc.dart';

@freezed
class CategoryWatcherState with _$CategoryWatcherState {
  const factory CategoryWatcherState({
    required RequestState state,
    required String message,
    required List<Category> categoryList,
  }) = _Initial;
  factory CategoryWatcherState.initial() {
    return const CategoryWatcherState(
      state: RequestState.empty,
      message: '',
      categoryList: [],
    );
  }
}
