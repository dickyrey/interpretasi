import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:interpretasi/src/domain/usecases/auth/sign_in_with_google.dart';

part 'sign_in_with_google_actor_bloc.freezed.dart';
part 'sign_in_with_google_actor_event.dart';
part 'sign_in_with_google_actor_state.dart';

@injectable
class SignInWithGoogleActorBloc
    extends Bloc<SignInWithGoogleActorEvent, SignInWithGoogleActorState> {
  SignInWithGoogleActorBloc(this._googleSignIn)
      : super(const SignInWithGoogleActorState.initial()) {
    on<SignInWithGoogleActorEvent>((event, emit) async {
      await event.map(
        signIn: (event) async {
          emit(const SignInWithGoogleActorState.signInProgress());
          final result = await _googleSignIn.execute();
          await result.fold(
            (f) async {
              emit(SignInWithGoogleActorState.signInFailure(f.message));
            },
            (_) async {
              emit(const SignInWithGoogleActorState.signInSuccess());
            },
          );
        },
      );
    });
  }
  final SignInWithGoogle _googleSignIn;
}
