import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:interpretasi/l10n/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'localization_watcher_event.dart';
part 'localization_watcher_state.dart';
part 'localization_watcher_bloc.freezed.dart';

@injectable
class LocalizationWatcherBloc
    extends Bloc<LocalizationWatcherEvent, LocalizationWatcherState> {
  LocalizationWatcherBloc() : super(LocalizationWatcherState.initial()) {
    on<LocalizationWatcherEvent>((event, emit) async {
      await event.map(
        init: (_) async {
          final prefs = await SharedPreferences.getInstance();
          if (prefs.getString('locale') == 'en') {
            await prefs.setString('locale', 'en');
            emit(state.copyWith(selectedLocale: L10n.all.last));
          }else{
            await prefs.setString('locale', 'id');
            emit(state.copyWith(selectedLocale: L10n.all.first));
          }
        },
        select: (event) async {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('locale', event.locale.languageCode);
          emit(state.copyWith(selectedLocale: event.locale));
        },
      );
    });
  }
}
