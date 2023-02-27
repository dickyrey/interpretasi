import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:interpretasi/src/domain/entities/verification_status.dart';
import 'package:interpretasi/src/domain/usecases/user/check_user_verification.dart';

part 'verification_status_watcher_event.dart';
part 'verification_status_watcher_state.dart';
part 'verification_status_watcher_bloc.freezed.dart';

@injectable
class VerificationStatusWatcherBloc extends Bloc<VerificationStatusWatcherEvent,
    VerificationStatusWatcherState> {
  VerificationStatusWatcherBloc(this._verification)
      : super(const VerificationStatusWatcherState.initial()) {
    on<VerificationStatusWatcherEvent>((event, emit) async {
      await event.map(
        init: (_) {
          emit(const VerificationStatusWatcherState.initial());
        },
        fetch: (_) async {
          emit(const VerificationStatusWatcherState.loading());
          final result = await _verification.execute();
          result.fold(
            (f) => emit(VerificationStatusWatcherState.error(f.message)),
            (data) => emit(VerificationStatusWatcherState.loaded(data)),
          );
        },
      );
    });
  }
  final CheckUserVerification _verification;
}
