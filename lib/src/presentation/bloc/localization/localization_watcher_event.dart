part of 'localization_watcher_bloc.dart';

@freezed
class LocalizationWatcherEvent with _$LocalizationWatcherEvent {
  const factory LocalizationWatcherEvent.init() = _Init;
  const factory LocalizationWatcherEvent.select(Locale locale) = _Select;
}
