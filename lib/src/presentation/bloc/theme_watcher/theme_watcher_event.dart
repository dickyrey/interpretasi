part of 'theme_watcher_bloc.dart';

@freezed
class ThemeWatcherEvent with _$ThemeWatcherEvent {
  const factory ThemeWatcherEvent.init() = _Init;
  const factory ThemeWatcherEvent.changeTheme() = _ChangeTheme;
}
