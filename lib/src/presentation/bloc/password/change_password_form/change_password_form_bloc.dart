import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interpretasi/src/common/enums.dart';
import 'package:interpretasi/src/domain/usecases/password/change_password.dart';

part 'change_password_form_event.dart';
part 'change_password_form_state.dart';
part 'change_password_form_bloc.freezed.dart';

class ChangePasswordFormBloc
    extends Bloc<ChangePasswordFormEvent, ChangePasswordFormState> {
  ChangePasswordFormBloc(this._change)
      : super(ChangePasswordFormState.inital()) {
    on<ChangePasswordFormEvent>((event, emit) async {
      await event.map(
        init: (_) {
          emit(ChangePasswordFormState.inital());
        },
        obscureText: (event) {
          if (state.isObscure == true) {
            emit(state.copyWith(isObscure: false));
          } else {
            emit(state.copyWith(isObscure: true));
          }
        },
        oldPassword: (event) {
          emit(
            state.copyWith(
              oldPassword: event.password,
              message: '',
            ),
          );
        },
        newPassword: (event) {
          emit(
            state.copyWith(
              newPassword: event.password,
              message: '',
            ),
          );
        },
        confirmPassword: (event) {
          emit(
            state.copyWith(
              confirmationPassword: event.password,
              message: '',
            ),
          );
        },
        change: (event) async {
          emit(
            state.copyWith(
              state: RequestState.loading,
              isSubmit: true,
            ),
          );
          final result = await _change.execute(
            oldPassword: state.oldPassword,
            newPassword: state.newPassword,
          );
          result.fold(
            (f) => emit(
              state.copyWith(
                state: RequestState.empty,
                isSubmit: false,
                message: f.message,
              ),
            ),
            (_) => emit(
              state.copyWith(
                isSubmit: false,
                state: RequestState.loaded,
              ),
            ),
          );
        },
      );
    });
  }
  final ChangePassword _change;
}
