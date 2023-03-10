import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:interpretasi/src/domain/usecases/auth/check_google_auth.dart';
import 'package:interpretasi/src/domain/usecases/auth/sign_out_with_google.dart';

part 'auth_watcher_bloc.freezed.dart';
part 'auth_watcher_event.dart';
part 'auth_watcher_state.dart';

@injectable
class AuthWatcherBloc extends Bloc<AuthWatcherEvent, AuthWatcherState> {
  AuthWatcherBloc({
    required this.checkGoogleAuth,
    required this.signOut,
  }) : super(const AuthWatcherState.initial()) {
    on<AuthWatcherEvent>((event, emit) async {
      await event.map(
        check: (event) async {
          emit(const AuthWatcherState.authInProgress());
          final result = await checkGoogleAuth.execute();
          result.fold(
            (data) => emit(const AuthWatcherState.authInFailure('')),
            (status) {
              if (status == true) {
                emit(const AuthWatcherState.authenticated());
              } else {
                emit(const AuthWatcherState.notAuthenticated());
              }
            },
          );
        },
        signOut: (event) async {
          emit(const AuthWatcherState.authInProgress());
          final result = await signOut.execute();
          result.fold(
            (f) => emit(AuthWatcherState.authInFailure(f.message)),
            (_) {
              emit(const AuthWatcherState.notAuthenticated());
            },
          );
        },
      );
    });
  }

  final CheckGoogleAuth checkGoogleAuth;
  final SignOut signOut;
}
