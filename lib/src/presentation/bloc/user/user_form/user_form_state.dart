part of 'user_form_bloc.dart';

@freezed
class UserFormState with _$UserFormState {
  const factory UserFormState({
    required RequestState state,
    required String message,
    required String name,
    required String email,
    required String imageUrl,
    required File? imageFile,
    required bool isSubmit,
  }) = _UserFormState;

  factory UserFormState.initial() => const UserFormState(
        state: RequestState.empty,
        message: '',
        name: '',
        email: '',
        imageUrl: Const.photo,
        imageFile: null,
        isSubmit: false,
      );
}
