part of 'sign_up_with_email_form_bloc.dart';

@freezed
class SignUpWithEmailFormState with _$SignUpWithEmailFormState {
  const factory SignUpWithEmailFormState({
    required RequestState state,
    required String message,
    required bool isSubmit,
    required String email,
  }) = _SignUpWithEmailFormState;

  factory SignUpWithEmailFormState.initial() {
    return const SignUpWithEmailFormState(
      state: RequestState.empty,
      message: '',
      isSubmit: false,
      email: '',
    );
  }
}
