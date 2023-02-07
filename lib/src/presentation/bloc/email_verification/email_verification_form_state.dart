part of 'email_verification_form_bloc.dart';

@freezed
class EmailVerificationFormState with _$EmailVerificationFormState {
  const factory EmailVerificationFormState({
    required RequestState state,
    required String message,
    required bool isSubmit,
    required bool isTimeoutDone,
  }) = _EmailVerificationFormState;

  factory EmailVerificationFormState.initial() {
    return const EmailVerificationFormState(
      state: RequestState.empty,
      message: '',
      isSubmit: false,
      isTimeoutDone: false,
    );
  }
}
