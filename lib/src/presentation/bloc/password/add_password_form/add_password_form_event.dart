part of 'add_password_form_bloc.dart';

@freezed
class AddPasswordFormEvent with _$AddPasswordFormEvent {
  const factory AddPasswordFormEvent.initial() = _Initial;
  const factory AddPasswordFormEvent.passwordOnChanged(String password) = _PasswordOnChanged;
  const factory AddPasswordFormEvent.repeatPasswordOnChanged(String repeatPassword) = _RepeatPasswordOnChanged;
  const factory AddPasswordFormEvent.addPasswordPressed() = _AddPasswordPressed;
  const factory AddPasswordFormEvent.obscureTextPressed() = _ObscureTextPressed;
}
