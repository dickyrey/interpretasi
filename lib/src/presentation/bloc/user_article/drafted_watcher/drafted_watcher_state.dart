part of 'drafted_watcher_bloc.dart';

@freezed
class DraftedWatcherState with _$DraftedWatcherState {
  const factory DraftedWatcherState.initial() = _Initial;
  const factory DraftedWatcherState.loading() = _Loading;
  const factory DraftedWatcherState.error(String message) = _Error;
  const factory DraftedWatcherState.loaded({
    required List<Article> articleList,
    required bool hasReachedMax,
  }) = _Loaded;
}
