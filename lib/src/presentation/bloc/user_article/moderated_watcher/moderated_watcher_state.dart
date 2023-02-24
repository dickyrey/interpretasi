part of 'moderated_watcher_bloc.dart';

@freezed
class ModeratedWatcherState with _$ModeratedWatcherState {
  const factory ModeratedWatcherState.initial() = _Initial;
  const factory ModeratedWatcherState.loading() = _Loading;
  const factory ModeratedWatcherState.error(String message) = _Error;
  const factory ModeratedWatcherState.loaded({
    required List<Article> articleList,
    required bool hasReachedMax,
  }) = _Loaded;
}
