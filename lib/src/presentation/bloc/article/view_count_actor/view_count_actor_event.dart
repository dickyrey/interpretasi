part of 'view_count_actor_bloc.dart';

@freezed
class ViewCountActorEvent with _$ViewCountActorEvent {
  const factory ViewCountActorEvent.add(String id) = _Add;
}
