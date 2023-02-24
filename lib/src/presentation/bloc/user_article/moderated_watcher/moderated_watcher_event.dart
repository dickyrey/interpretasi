part of 'moderated_watcher_bloc.dart';

@freezed
class ModeratedWatcherEvent with _$ModeratedWatcherEvent {
  const factory ModeratedWatcherEvent.fetch({
    required bool isRefresh,
  }) = _Fetch;
}
