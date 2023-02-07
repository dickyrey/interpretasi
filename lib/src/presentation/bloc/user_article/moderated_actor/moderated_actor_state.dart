part of 'moderated_actor_bloc.dart';

@freezed
class ModeratedActorState with _$ModeratedActorState {
  const factory ModeratedActorState.initial() = _Initial;
  const factory ModeratedActorState.loading() = _Loading;
  const factory ModeratedActorState.error(String msg) = _Error;
  const factory ModeratedActorState.success() = _Success;
}
