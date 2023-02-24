part of 'banned_watcher_bloc.dart';

@freezed
class BannedWatcherEvent with _$BannedWatcherEvent {
  const factory BannedWatcherEvent.fetch({
    required bool isRefresh,
  }) = _Fetch;
}
