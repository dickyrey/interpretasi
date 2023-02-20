part of 'forgot_password_form_bloc.dart';

@freezed
class ForgotPasswordFormState with _$ForgotPasswordFormState {
  const factory ForgotPasswordFormState({
    required RequestState state,
    required String message,
    required String email,
    required bool isSubmit,
  }) = _ForgotPasswordFormState;

  factory ForgotPasswordFormState.initial() {
    return const ForgotPasswordFormState(
      state: RequestState.empty,
      message: '',
      email: '',
      isSubmit: false,
    );
  }
}
