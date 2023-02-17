import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interpretasi/src/domain/entities/author.dart';
import 'package:interpretasi/src/domain/usecases/author/get_author.dart';

part 'author_watcher_event.dart';
part 'author_watcher_state.dart';
part 'author_watcher_bloc.freezed.dart';

class AuthorWatcherBloc extends Bloc<AuthorWatcherEvent, AuthorWatcherState> {
  AuthorWatcherBloc(this._author) : super(const AuthorWatcherState.initial()) {
    on<AuthorWatcherEvent>((event, emit) async {
      await event.map(
        fetch: (event) async {
          emit(const AuthorWatcherState.loading());

          final result = await _author.execute(event.id);

          result.fold(
            (f) => emit(AuthorWatcherState.error(f.message)),
            (data) => emit(AuthorWatcherState.loaded(data)),
          );
        },
      );
    });
  }
  final GetAuthor _author;
}
