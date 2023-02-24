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
        fetch: (_) async {
          emit(const TrendingArticleWatcherState.loading());

          final result = await _article.execute(
            category: '',
            page: 1,
            query: '',
            isTrending: true,
            orderBy: OrderBy.latest,
          );

          result.fold(
            (f) => emit(TrendingArticleWatcherState.error(f.message)),
            (data) => emit(TrendingArticleWatcherState.loaded(data)),
          );
        },
      );
    });
  }
  final GetArticle _article;
}
