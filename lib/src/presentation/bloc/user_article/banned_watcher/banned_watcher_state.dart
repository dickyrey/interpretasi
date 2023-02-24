part of 'banned_watcher_bloc.dart';

@freezed
class BannedWatcherState with _$BannedWatcherState {
  const factory BannedWatcherState.initial() = _Initial;
  const factory BannedWatcherState.loading() = _Loading;
  const factory BannedWatcherState.error(String message) = _Error;
  const factory BannedWatcherState.loaded({
    required List<Article> articleList,
    required bool hasReachedMax,
  }) = _Loaded;
}
