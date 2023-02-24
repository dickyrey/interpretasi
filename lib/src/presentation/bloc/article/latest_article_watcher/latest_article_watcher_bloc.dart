import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interpretasi/src/common/enums.dart';
import 'package:interpretasi/src/domain/entities/article.dart';
import 'package:interpretasi/src/domain/usecases/article/get_article.dart';

part 'latest_article_watcher_event.dart';
part 'latest_article_watcher_state.dart';
part 'latest_article_watcher_bloc.freezed.dart';

class LatestArticleWatcherBloc
    extends Bloc<LatestArticleWatcherEvent, LatestArticleWatcherState> {
  LatestArticleWatcherBloc(this._getArticle)
      : super(const LatestArticleWatcherState.initial()) {
    on<LatestArticleWatcherEvent>((event, emit) async {
      await event.map(
        fetch: (event) async {
          if (event.isRefresh == true) {
            page = 1;
            localArticleList.clear();
          }
          if (page == 1) {
            emit(const LatestArticleWatcherState.loading());
          }
          final result = await _getArticle.execute(
            category: '',
            page: page,
            query: '',
            isTrending: false,
            orderBy: OrderBy.latest,
          );
          result.fold(
            (f) => emit(LatestArticleWatcherState.error(f.message)),
            (data) {
              print(data);
              if (data.isNotEmpty) {
                if (data.length < 5) {
                  final list = List.of(localArticleList)..addAll(data);
                  emit(
                    LatestArticleWatcherState.loaded(
                      hasReachedMax: true,
                      articleList: list,
                    ),
                  );
                  localArticleList.addAll(data);
                } else {
                  page += 1;
                  final list = List.of(localArticleList)..addAll(data);
                  emit(
                    LatestArticleWatcherState.loaded(
                      hasReachedMax: false,
                      articleList: list,
                    ),
                  );
                  localArticleList.addAll(data);
                }
              } else {
                emit(
                  LatestArticleWatcherState.loaded(
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
  final GetArticle _getArticle;
}
