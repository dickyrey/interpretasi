part of 'change_password_form_bloc.dart';

@freezed
class ChangePasswordFormEvent with _$ChangePasswordFormEvent {
  const factory ChangePasswordFormEvent.init() = _Init;
  const factory ChangePasswordFormEvent.oldPassword(String password) = _OldPassword;
  const factory ChangePasswordFormEvent.newPassword(String password) = _NewPassword;
  const factory ChangePasswordFormEvent.confirmPassword(String password) = _ConfirmPassword;
  const factory ChangePasswordFormEvent.change() = _Change;
  const factory ChangePasswordFormEvent.obscureText() = _ObscureText;
}
