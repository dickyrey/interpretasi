part of 'change_password_form_bloc.dart';

@freezed
class ChangePasswordFormState with _$ChangePasswordFormState {
  const factory ChangePasswordFormState({
    required RequestState state,
    required String message,
    required String oldPassword,
    required String newPassword,
    required String confirmationPassword,
    required bool obscureText,
    required bool isSubmitting,
  }) = _ChangePasswordFormState;

  factory ChangePasswordFormState.inital() {
    return const ChangePasswordFormState(
      state: RequestState.empty,
      message: '',
      oldPassword: '',
      newPassword: '',
      confirmationPassword: '',
      obscureText: false,
      isSubmitting: false,
    );
  }
}
