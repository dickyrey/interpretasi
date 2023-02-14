import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_watcher_event.dart';
part 'theme_watcher_state.dart';
part 'theme_watcher_bloc.freezed.dart';

class ThemeWatcherBloc extends Bloc<ThemeWatcherEvent, ThemeWatcherState> {
  ThemeWatcherBloc() : super(ThemeWatcherState.initial()) {
    on<ThemeWatcherEvent>((event, emit) async {
      await event.map(
        init: (_) async {
          final prefs = await SharedPreferences.getInstance();
          final mode = await prefs.setBool('isThemeLight', true);
          if (mode == true) {
            emit(state.copyWith(isThemeLight: true));
          }
          emit(state.copyWith(isThemeLight: false));
        },
        changeTheme: (_) async {
          final prefs = await SharedPreferences.getInstance();
          if (state.isThemeLight == true) {
            await prefs.setBool('isThemeLight', false);
            emit(state.copyWith(isThemeLight: false));
          } else {
            await prefs.setBool('isThemeLight', true);
            emit(state.copyWith(isThemeLight: true));
          }
        },
      );
    });
  }
}
