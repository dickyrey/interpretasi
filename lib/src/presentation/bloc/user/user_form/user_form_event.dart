part of 'user_form_bloc.dart';

@freezed
class UserFormEvent with _$UserFormEvent {
  const factory UserFormEvent.init() = _Init;
  const factory UserFormEvent.initialize(User user) = _Initialize;
  const factory UserFormEvent.name(String name) = _Name;
  const factory UserFormEvent.pickImage(ImageSource source) = _PickImage;
  const factory UserFormEvent.save() = _Save;
}
