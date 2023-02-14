part of 'localization_watcher_bloc.dart';

@freezed
class LocalizationWatcherState with _$LocalizationWatcherState {
  const factory LocalizationWatcherState({
    required Locale selectedLocale,
    required List<Locale> supportedLocales,
  }) = _LocalizationWatcherState;

  factory LocalizationWatcherState.initial() => LocalizationWatcherState(
        selectedLocale: L10n.all.first,
        supportedLocales: L10n.all,
      );
}
