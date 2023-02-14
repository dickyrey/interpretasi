import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interpretasi/src/domain/usecases/user_article/change_to_moderated.dart';

part 'moderated_actor_event.dart';
part 'moderated_actor_state.dart';
part 'moderated_actor_bloc.freezed.dart';

class ModeratedActorBloc
    extends Bloc<ModeratedActorEvent, ModeratedActorState> {
  ModeratedActorBloc(this._changetomoderated) : super(const _Initial()) {
    on<ModeratedActorEvent>((event, emit) async {
      await event.map(
        change: (event) async {
          emit(const ModeratedActorState.loading());
          final result = await _changetomoderated.execute(event.id);
          result.fold(
            (f) => emit(ModeratedActorState.error(f.message)),
            (_) => emit(const ModeratedActorState.success()),
          );
        },
      );
    });
  }
  final ChangeToModerated _changetomoderated;
}
