import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interpretasi/src/common/enums.dart';
import 'package:interpretasi/src/domain/entities/article.dart';
import 'package:interpretasi/src/domain/usecases/user_article/get_banned_article.dart';

part 'user_article_banned_watcher_event.dart';
part 'user_article_banned_watcher_state.dart';
part 'user_article_banned_watcher_bloc.freezed.dart';

class UserArticleBannedWatcherBloc
    extends Bloc<UserArticleBannedWatcherEvent, UserArticleBannedWatcherState> {
  UserArticleBannedWatcherBloc(this._article)
      : super(UserArticleBannedWatcherState.initial()) {
    on<UserArticleBannedWatcherEvent>((event, emit) async {
      await event.map(
        fetch: (event) async {
          final articles = state.articleList;

          if (state.page == 1) {
            emit(state.copyWith(state: RequestState.loading));
          }
          if (state.page != null) {
            final result = await _article.execute(state.page!);
            result.fold(
              (f) => emit(
                state.copyWith(
                  state: RequestState.error,
                  message: f.message,
                ),
              ),
              (data) {
                final counter = state.page! + 1;
                if (data.isEmpty) {
                  emit(state.copyWith(state: RequestState.empty));
                } else if (data.length < state.totalItem) {
                  final list = List.of(articles)..addAll(data);
                  emit(
                    state.copyWith(
                      state: RequestState.loaded,
                      articleList: list,
                      page: null,
                    ),
                  );
                } else {
                  final list = List.of(articles)..addAll(data);
                  emit(
                    state.copyWith(
                      state: RequestState.loaded,
                      articleList: list,
                      page: counter,
                    ),
                  );
                }
              },
            );
          }
        },
      );
    });
  }
  final GetBannedArticle _article;
}
