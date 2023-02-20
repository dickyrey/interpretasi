part of 'upload_image_actor_bloc.dart';

@freezed
class UploadImageActorEvent with _$UploadImageActorEvent {
  const factory UploadImageActorEvent.init() = _Init;
  const factory UploadImageActorEvent.upload(File image) = _Upload;
}
