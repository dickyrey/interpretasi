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
          final isDarkMode = prefs.getBool('isDarkMode') ?? false;
          emit(state.copyWith(isDarkMode: isDarkMode));
        },
        changeTheme: (_) async {
          final prefs = await SharedPreferences.getInstance();

          if (state.isDarkMode == true) {
            emit(state.copyWith(isDarkMode: false));
            await prefs.setBool('isDarkMode', false);
          } else {
            emit(state.copyWith(isDarkMode: true));
            await prefs.setBool('isDarkMode', true);
          }
        },
      );
    });
  }
}
