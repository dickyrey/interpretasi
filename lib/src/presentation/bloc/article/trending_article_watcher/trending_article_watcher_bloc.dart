import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interpretasi/src/common/enums.dart';
import 'package:interpretasi/src/domain/entities/article.dart';
import 'package:interpretasi/src/domain/usecases/article/get_article.dart';

part 'trending_article_watcher_event.dart';
part 'trending_article_watcher_state.dart';
part 'trending_article_watcher_bloc.freezed.dart';

class TrendingArticleWatcherBloc
    extends Bloc<TrendingArticleWatcherEvent, TrendingArticleWatcherState> {
  TrendingArticleWatcherBloc(this._article) : super(const _Initial()) {
    on<TrendingArticleWatcherEvent>((event, emit) async {
      await event.map(
        fetch: (event) async {
          if (event.isRefresh == true) {
            page = 1;
            localArticleList.clear();
          }
          if (page == 1) {
            emit(const TrendingArticleWatcherState.loading());
          }
          final result = await _article.execute(
            category: '',
            page: page,
            query: '',
            isTrending: true,
            orderBy: OrderBy.latest,
          );
          print('REQ PAGE : $page');
          result.fold(
            (f) => emit(TrendingArticleWatcherState.error(f.message)),
            (data) {
              if (data.isNotEmpty) {
                if (data.length < 5) {
                  final list = List.of(localArticleList)..addAll(data);
                  emit(
                    TrendingArticleWatcherState.loaded(
                      hasReachedMax: true,
                      articleList: list,
                    ),
                  );
                  localArticleList.addAll(data);
                } else {
                  page += 1;
                  final list = List.of(localArticleList)..addAll(data);
                  emit(
                    TrendingArticleWatcherState.loaded(
                      hasReachedMax: false,
                      articleList: list,
                    ),
                  );
                  localArticleList.addAll(data);
                }
              } else {
                emit(
                  TrendingArticleWatcherState.loaded(
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
  final GetArticle _article;
}
