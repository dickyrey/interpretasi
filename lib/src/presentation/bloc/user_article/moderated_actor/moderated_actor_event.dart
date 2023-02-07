part of 'moderated_actor_bloc.dart';

@freezed
class ModeratedActorEvent with _$ModeratedActorEvent {
  const factory ModeratedActorEvent.change(String id) = _Change;
}
