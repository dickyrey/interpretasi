part of 'category_watcher_bloc.dart';

@freezed
class CategoryWatcherEvent with _$CategoryWatcherEvent {
  const factory CategoryWatcherEvent.fetch() = _Fetch;
}
