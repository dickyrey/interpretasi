part of 'drafted_watcher_bloc.dart';

@freezed
class DraftedWatcherEvent with _$DraftedWatcherEvent {
  const factory DraftedWatcherEvent.fetch({
    required bool isRefresh,
  }) = _Fetch;
}
