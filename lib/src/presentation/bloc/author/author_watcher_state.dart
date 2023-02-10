part of 'author_watcher_bloc.dart';

@freezed
class AuthorWatcherState with _$AuthorWatcherState {
  const factory AuthorWatcherState.initial() = _Initial;
  const factory AuthorWatcherState.loading() = _Loading;
  const factory AuthorWatcherState.error(String message) = _Error;
  const factory AuthorWatcherState.loaded(Author author) = _Loaded;
}
