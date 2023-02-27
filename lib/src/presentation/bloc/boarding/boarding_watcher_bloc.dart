import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:interpretasi/src/domain/entities/boarding.dart';
import 'package:interpretasi/src/domain/usecases/on_boarding/get_boarding_list.dart';

part 'boarding_watcher_event.dart';
part 'boarding_watcher_state.dart';
part 'boarding_watcher_bloc.freezed.dart';

@injectable
class BoardingWatcherBloc extends Bloc<BoardingWatcherEvent, BoardingWatcherState> {
  BoardingWatcherBloc(this._getBoardingList) : super(const BoardingWatcherState.initial()) {
    on<BoardingWatcherEvent>(
      (event, emit) async {
        await event.map(
          fetch: (_) async {
            emit(const BoardingWatcherState.loading());

            final result = await _getBoardingList.execute();

            result.fold(
              (f) => emit(BoardingWatcherState.error(f.message)),
              (data) => emit(BoardingWatcherState.loaded(data)),
            );
          },
        );
      },
    );
  }

  final GetBoardingList _getBoardingList;

}
