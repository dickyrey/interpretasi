part of 'sign_in_with_email_form_bloc.dart';

@freezed
class SignInWithEmailFormEvent with _$SignInWithEmailFormEvent {
  const factory SignInWithEmailFormEvent.init() = _Init;
  const factory SignInWithEmailFormEvent.obscureText() = _ObscureText;
  const factory SignInWithEmailFormEvent.signIn() = _SignIn;
  const factory SignInWithEmailFormEvent.email(String email) = _Email;
  const factory SignInWithEmailFormEvent.password(String password) = _Password;

}
