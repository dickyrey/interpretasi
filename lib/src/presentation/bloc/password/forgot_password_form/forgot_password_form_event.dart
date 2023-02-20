part of 'forgot_password_form_bloc.dart';

@freezed
class ForgotPasswordFormEvent with _$ForgotPasswordFormEvent {
  const factory ForgotPasswordFormEvent.init() = _Init;
  const factory ForgotPasswordFormEvent.email(String val) = _Email;
  const factory ForgotPasswordFormEvent.send() = _Send;
}
