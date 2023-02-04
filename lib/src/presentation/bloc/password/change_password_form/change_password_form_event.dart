part of 'change_password_form_bloc.dart';

@freezed
class ChangePasswordFormEvent with _$ChangePasswordFormEvent {
  const factory ChangePasswordFormEvent.init() = _Init;
  const factory ChangePasswordFormEvent.oldPasswordOnChanged(String password) = _OldPasswordOnChanged;
  const factory ChangePasswordFormEvent.newPasswordOnChanged(String password) = _NewPasswordOnChanged;
  const factory ChangePasswordFormEvent.confirmationOnChanged(String password) = _ConfirmationPasswordOnChanged;
  const factory ChangePasswordFormEvent.changePasswordPressed() = _ChangePasswordPressed;
  const factory ChangePasswordFormEvent.obscureTextPressed() = _ObscureTextPressed;
}
