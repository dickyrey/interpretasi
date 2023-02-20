import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interpretasi/src/domain/usecases/article/upload_image.dart';

part 'upload_image_actor_event.dart';
part 'upload_image_actor_state.dart';
part 'upload_image_actor_bloc.freezed.dart';

class UploadImageActorBloc
    extends Bloc<UploadImageActorEvent, UploadImageActorState> {
  UploadImageActorBloc(this._upload)
      : super(const UploadImageActorState.initial()) {
    on<UploadImageActorEvent>((event, emit) async {
      await event.map(
        init: (event) {
          emit(const UploadImageActorState.initial());
        },
        upload: (event) async {
          emit(const UploadImageActorState.loading());
          final result = await _upload.execute(event.image);
          result.fold(
            (f) => emit(UploadImageActorState.error(f.message)),
            (data) => emit(UploadImageActorState.success(data)),
          );
        },
      );
    });
  }
  final UploadImage _upload;
}
