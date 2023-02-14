import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interpretasi/l10n/l10n.dart';

part 'localization_watcher_event.dart';
part 'localization_watcher_state.dart';
part 'localization_watcher_bloc.freezed.dart';

class LocalizationWatcherBloc
    extends Bloc<LocalizationWatcherEvent, LocalizationWatcherState> {
  LocalizationWatcherBloc() : super(LocalizationWatcherState.initial()) {
    on<LocalizationWatcherEvent>((event, emit) async {
      event.map(
        select: (event) {
          emit(state.copyWith(selectedLocale: event.locale));
        },
      );
    });
  }
}
