part of 'email_verification_form_bloc.dart';

@freezed
class EmailVerificationFormEvent with _$EmailVerificationFormEvent {
  const factory EmailVerificationFormEvent.onFinished() = _OnFinished;
  const factory EmailVerificationFormEvent.startTimeOut(CountdownController controller) = _StartTimeOut;
}
