import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/common/enums.dart';
import 'package:interpretasi/src/domain/entities/user.dart';
import 'package:interpretasi/src/domain/usecases/user/update_user_profile.dart';
import 'package:interpretasi/src/utilities/image_cropper_utils.dart';

part 'user_form_bloc.freezed.dart';
part 'user_form_event.dart';
part 'user_form_state.dart';

class UserFormBloc extends Bloc<UserFormEvent, UserFormState> {
  UserFormBloc(this._update) : super(UserFormState.initial()) {
    on<UserFormEvent>((event, emit) async {
      await event.map(
        init: (_) {
          emit(UserFormState.initial());
        },
        initialize: (event) {
          emit(
            state.copyWith(
              state: RequestState.empty,
              message: '',
              isSubmit: false,
              name: event.user.name,
              email: event.user.email,
              imageUrl: event.user.photo,
              imageFile: null,
            ),
          );
        },
        name: (e) {
          emit(
            state.copyWith(
              name: e.name,
              isSubmit: false,
            ),
          );
        },
        pickImage: (e) async {
          final pickedImage = await ImagePicker().pickImage(
            source: e.source,
          );
          if (pickedImage != null) {
            final croppedImage = await ImageCropperUtils.cropImage(
              pickedImage.path,
            );
            if (croppedImage != null) {
              emit(state.copyWith(imageFile: File(croppedImage.path)));
            }
          }
        },
        save: (_) async {
          emit(
            state.copyWith(
              state: RequestState.loading,
              isSubmit: true,
            ),
          );
          final result = await _update.execute(
            name: state.name,
            imageFile: state.imageFile,
          );
          result.fold(
            (f) => emit(
              state.copyWith(
                state: RequestState.error,
                message: f.message,
                isSubmit: false,
              ),
            ),
            (_) => emit(
              state.copyWith(
                state: RequestState.loaded,
                isSubmit: false,
              ),
            ),
          );
        },
      );
    });
  }
  final UpdateUserProfile _update;
}
