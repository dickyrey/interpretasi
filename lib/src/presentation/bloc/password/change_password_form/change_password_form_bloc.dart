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
        obscureTextPressed: (event) {
          if (state.obscureText == true) {
            emit(state.copyWith(obscureText: false));
          } else {
            emit(state.copyWith(obscureText: true));
          }
        },
        oldPasswordOnChanged: (event) {
          emit(
            state.copyWith(
              oldPassword: event.password,
              message: '',
            ),
          );
        },
        newPasswordOnChanged: (event) {
          emit(
            state.copyWith(
              newPassword: event.password,
              message: '',
            ),
          );
        },
        confirmationOnChanged: (event) {
          emit(
            state.copyWith(
              confirmationPassword: event.password,
              message: '',
            ),
          );
        },
        changePasswordPressed: (event) async {
          emit(
            state.copyWith(
              state: RequestState.loading,
              isSubmitting: true,
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
                isSubmitting: false,
                message: f.message,
              ),
            ),
            (_) => emit(
              state.copyWith(
                isSubmitting: false,
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
