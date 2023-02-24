part of 'rejected_watcher_bloc.dart';

@freezed
class RejectedWatcherEvent with _$RejectedWatcherEvent {
  const factory RejectedWatcherEvent.fetch({
    required bool isRefresh,
  }) = _Fetch;
}
