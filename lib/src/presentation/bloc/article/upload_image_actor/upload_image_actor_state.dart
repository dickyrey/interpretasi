part of 'upload_image_actor_bloc.dart';

@freezed
class UploadImageActorState with _$UploadImageActorState {
  const factory UploadImageActorState.initial() = _Initial;
  const factory UploadImageActorState.loading() = _Loading;
  const factory UploadImageActorState.error(String message) = _Error;
  const factory UploadImageActorState.success(String url) = _Success;
}
