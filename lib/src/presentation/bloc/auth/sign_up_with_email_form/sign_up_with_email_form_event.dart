part of 'sign_up_with_email_form_bloc.dart';

@freezed
class SignUpWithEmailFormEvent with _$SignUpWithEmailFormEvent {
  const factory SignUpWithEmailFormEvent.init() = _Init;
  const factory SignUpWithEmailFormEvent.email(String val) = _Email;
  const factory SignUpWithEmailFormEvent.signUp() = _SignUp;
}
