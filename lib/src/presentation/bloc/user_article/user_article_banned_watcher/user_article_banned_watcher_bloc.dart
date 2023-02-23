import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interpretasi/src/domain/entities/article.dart';
import 'package:interpretasi/src/domain/usecases/user_article/get_banned_article.dart';

part 'user_article_banned_watcher_event.dart';
part 'user_article_banned_watcher_state.dart';
part 'user_article_banned_watcher_bloc.freezed.dart';

class UserArticleBannedWatcherBloc
    extends Bloc<UserArticleBannedWatcherEvent, UserArticleBannedWatcherState> {
  UserArticleBannedWatcherBloc(this._article)
      : super(const UserArticleBannedWatcherState.initial()) {
    on<UserArticleBannedWatcherEvent>((event, emit) async {
      await event.map(
        fetch: (_) async {
          emit(const UserArticleBannedWatcherState.loading());
          final result = await _article.execute(1);
          result.fold(
            (f) => emit(const UserArticleBannedWatcherState.error()),
            (data) => emit(UserArticleBannedWatcherState.loaded(data)),
          );
        },
      );
    });
  }
  final GetBannedArticle _article;
}
