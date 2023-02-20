import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interpretasi/src/common/enums.dart';
import 'package:interpretasi/src/domain/usecases/password/forgot_password.dart';

part 'forgot_password_form_event.dart';
part 'forgot_password_form_state.dart';
part 'forgot_password_form_bloc.freezed.dart';

class ForgotPasswordFormBloc
    extends Bloc<ForgotPasswordFormEvent, ForgotPasswordFormState> {
  ForgotPasswordFormBloc(this._password)
      : super(ForgotPasswordFormState.initial()) {
    on<ForgotPasswordFormEvent>((event, emit) async {
      await event.map(
        init: (_) {
          emit(ForgotPasswordFormState.initial());
        },
        email: (event) {
          emit(
            state.copyWith(
              email: event.val,
              message: '',
            ),
          );
        },
        send: (_) async {
          emit(state.copyWith(state: RequestState.loading, isSubmit: true));
          final result = await _password.execute(state.email);
          result.fold(
            (f) => emit(
              state.copyWith(
                state: RequestState.error,
                message: f.message,
                isSubmit: false,
              ),
            ),
            (_) => emit(
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
  final ForgotPassword _password;
}
