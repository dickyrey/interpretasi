import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interpretasi/src/common/enums.dart';
import 'package:interpretasi/src/domain/entities/article.dart';
import 'package:interpretasi/src/domain/usecases/user_article/get_drafted_article.dart';

part 'user_article_drafted_watcher_event.dart';
part 'user_article_drafted_watcher_state.dart';
part 'user_article_drafted_watcher_bloc.freezed.dart';

class UserArticleDraftedWatcherBloc extends Bloc<UserArticleDraftedWatcherEvent,
    UserArticleDraftedWatcherState> {
  UserArticleDraftedWatcherBloc(this._article)
      : super(const UserArticleDraftedWatcherState.initial()) {
    on<UserArticleDraftedWatcherEvent>((event, emit) async {
      await event.map(
        fetch: (event) async {
          if (event.isRefresh == true) {
            page = 1;
            localArticleList.clear();
          }
          if (page == 1) {
            emit(const UserArticleDraftedWatcherState.loading());
          }
          final result = await _article.execute(page);
          result.fold(
            (f) => emit(UserArticleDraftedWatcherState.error(f.message)),
            (data) {
              if (data.isNotEmpty) {
                if (data.length < 5) {
                  final list = List.of(localArticleList)..addAll(data);
                  emit(
                    UserArticleDraftedWatcherState.loaded(
                      hasReachedMax: true,
                      articleList: list,
                    ),
                  );
                  localArticleList.addAll(data);
                } else {
                  page += 1;
                  final list = List.of(localArticleList)..addAll(data);
                  emit(
                    UserArticleDraftedWatcherState.loaded(
                      hasReachedMax: false,
                      articleList: list,
                    ),
                  );
                  localArticleList.addAll(data);
                }
              } else if (data.isEmpty) {
                emit(
                  UserArticleDraftedWatcherState.loaded(
                    hasReachedMax: true,
                    articleList: localArticleList,
                  ),
                );
              }
            },
          );
        },
      );
    });
  }
  int page = 1;
  final localArticleList = <Article>[];
  final GetDraftedArticle _article;
}
