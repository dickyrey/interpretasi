part of 'theme_watcher_bloc.dart';

@freezed
class ThemeWatcherState with _$ThemeWatcherState {
  const factory ThemeWatcherState({
    required bool isThemeLight,
  }) = _ThemeWatcherState;
  factory ThemeWatcherState.initial() {
    return const ThemeWatcherState(isThemeLight: true);
  }
}
