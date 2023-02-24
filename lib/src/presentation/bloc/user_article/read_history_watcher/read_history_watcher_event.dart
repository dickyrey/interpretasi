part of 'read_history_watcher_bloc.dart';

@freezed
class ReadHistoryWatcherEvent with _$ReadHistoryWatcherEvent {
  const factory ReadHistoryWatcherEvent.init() = _Init;
  const factory ReadHistoryWatcherEvent.fetch({
    required bool isRefresh,
  }) = _Fetch;
}
