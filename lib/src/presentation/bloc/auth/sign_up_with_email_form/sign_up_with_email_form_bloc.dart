import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interpretasi/src/common/enums.dart';
import 'package:interpretasi/src/domain/usecases/auth/sign_up_with_email.dart';

part 'sign_up_with_email_form_event.dart';
part 'sign_up_with_email_form_state.dart';
part 'sign_up_with_email_form_bloc.freezed.dart';

class SignUpWithEmailFormBloc
    extends Bloc<SignUpWithEmailFormEvent, SignUpWithEmailFormState> {
  SignUpWithEmailFormBloc(this._signUp)
      : super(SignUpWithEmailFormState.initial()) {
    on<SignUpWithEmailFormEvent>((event, emit) async {
      await event.map(
        init: (_) {
          emit(SignUpWithEmailFormState.initial());
        },
        email: (event) {
          emit(state.copyWith(email: event.val));
        },
        signUp: (_) async {
          emit(
            state.copyWith(
              state: RequestState.loading,
              isSubmit: true,
            ),
          );
          final result = await _signUp.execute(state.email);
          result.fold(
            (f) => emit(
              state.copyWith(
                state: RequestState.error,
                message: f.message,
                isSubmit: false,
              ),
            ),
            (r) => emit(
              state.copyWith(
                state: RequestState.loaded,
                isSubmit: false,
              ),
            ),
          );
        },
      );
    });
  }
  final SignUpWithEmail _signUp;
}
