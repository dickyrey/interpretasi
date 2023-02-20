import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interpretasi/src/domain/usecases/article/add_view_count.dart';

part 'view_count_actor_event.dart';
part 'view_count_actor_state.dart';
part 'view_count_actor_bloc.freezed.dart';

class ViewCountActorBloc
    extends Bloc<ViewCountActorEvent, ViewCountActorState> {
  ViewCountActorBloc(this._count) : super(const ViewCountActorState.initial()) {
    on<ViewCountActorEvent>((event, emit) async {
      await event.map(
        add: (event) async {
          final result = await _count.execute(event.id);
          result.fold(
            (_) => emit(const ViewCountActorState.initial()),
            (_) => emit(const ViewCountActorState.initial()),
          );
        },
      );
    });
  }
  final AddViewCount _count;
}
