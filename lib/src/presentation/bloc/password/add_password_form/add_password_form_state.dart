part of 'add_password_form_bloc.dart';

@freezed
class AddPasswordFormState with _$AddPasswordFormState {
  const factory AddPasswordFormState({
    required RequestState state,
    required String message,
    required String password,
    required String repeatPassword,
    required bool obscureText,
    required bool isSubmit,
  }) = _AddPasswordFormState;

  factory AddPasswordFormState.initial() => const AddPasswordFormState(
        state: RequestState.empty,
        message: '',
        password: '',
        repeatPassword: '',
        obscureText: true,
        isSubmit: false,
      );
}
