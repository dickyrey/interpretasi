import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interpretasi/src/common/enums.dart';
import 'package:interpretasi/src/domain/usecases/password/add_password.dart';

part 'add_password_form_event.dart';
part 'add_password_form_state.dart';
part 'add_password_form_bloc.freezed.dart';

class AddPasswordFormBloc extends Bloc<AddPasswordFormEvent, AddPasswordFormState> {
  AddPasswordFormBloc(this._addPassword) : super(AddPasswordFormState.initial()) {
    on<AddPasswordFormEvent>((event, emit) async {
      await event.map(
        initial: (_) {
          emit(AddPasswordFormState.initial());
        },
        obscureTextPressed: (_) {
          if (state.obscureText == true) {
            emit(state.copyWith(obscureText: false));
          } else {
            emit(state.copyWith(obscureText: true));
          }
        },
        passwordOnChanged: (e) {
          emit(
            state.copyWith(
              password: e.password,
              isShowErrorMessages: false,
            ),
          );
        },
        repeatPasswordOnChanged: (e) {
          emit(
            state.copyWith(
              repeatPassword: e.repeatPassword,
              isShowErrorMessages: false,
            ),
          );
        },
        addPasswordPressed: (_) async {
          emit(
            state.copyWith(
              state: RequestState.loading,
              isSubmitting: true,
              isShowErrorMessages: false,
            ),
          );
          final result = await _addPassword.execute(state.password);
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
                password: '',
                repeatPassword: '',
                isSubmitting: false,
                state: RequestState.loaded,
              ),
            ),
          );
        },
      );
    });
  }
  final AddPassword _addPassword;
}
