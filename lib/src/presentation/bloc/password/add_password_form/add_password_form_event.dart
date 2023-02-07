part of 'add_password_form_bloc.dart';

@freezed
class AddPasswordFormEvent with _$AddPasswordFormEvent {
  const factory AddPasswordFormEvent.initial() = _Initial;
  const factory AddPasswordFormEvent.password(String password) = _Password;
  const factory AddPasswordFormEvent.repeatPassword(String repeatPassword) = _RepeatPassword;
  const factory AddPasswordFormEvent.addPassword() = _AddPassword;
  const factory AddPasswordFormEvent.obscureText() = _ObscureText;
}
