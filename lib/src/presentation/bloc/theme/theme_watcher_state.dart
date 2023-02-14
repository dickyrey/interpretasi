part of 'theme_watcher_bloc.dart';

@freezed
class ThemeWatcherState with _$ThemeWatcherState {
  const factory ThemeWatcherState({
    required bool isDarkMode,
  }) = _ThemeWatcherState;
  factory ThemeWatcherState.initial() {
    return const ThemeWatcherState(isDarkMode: false);
  }
}
