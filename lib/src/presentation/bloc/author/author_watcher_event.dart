part of 'author_watcher_bloc.dart';

@freezed
class AuthorWatcherEvent with _$AuthorWatcherEvent {
  const factory AuthorWatcherEvent.fetch(int id) = _Fetch;
}
