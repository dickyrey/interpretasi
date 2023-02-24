part of 'published_watcher_bloc.dart';

@freezed
class PublishedWatcherEvent with _$PublishedWatcherEvent {
  const factory PublishedWatcherEvent.fetch({
    required bool isRefresh,
  }) = _Fetch;
}
