import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:interpretasi/src/common/enums.dart';
import 'package:interpretasi/src/domain/entities/article.dart';
import 'package:interpretasi/src/domain/usecases/article/get_article.dart';

part 'article_by_category_watcher_event.dart';
part 'article_by_category_watcher_state.dart';
part 'article_by_category_watcher_bloc.freezed.dart';

@injectable
class ArticleByCategoryWatcherBloc
    extends Bloc<ArticleByCategoryWatcherEvent, ArticleByCategoryWatcherState> {
  ArticleByCategoryWatcherBloc(this._article)
      : super(ArticleByCategoryWatcherState.initial()) {
    on<ArticleByCategoryWatcherEvent>(
      (event, emit) async {
        await event.map(
          changeIndex: (event) {
            emit(
              state.copyWith(
                state: RequestState.empty,
                index: event.index,
              ),
            );
          },
          fetch: (event) async {
            emit(state.copyWith(state: RequestState.loading));

            final result = await _article.execute(
              category: event.id.toString(),
              page: 1,
              query: '',
              isTrending: false,
              orderBy: OrderBy.latest,
            );

            result.fold(
              (f) => emit(
                state.copyWith(state: RequestState.error, message: f.message),
              ),
              (data) => emit(
                state.copyWith(
                  state: RequestState.loaded,
                  articleList: data,
                ),
              ),
            );
          },
        );
      },
    );
  }
  final GetArticle _article;
}
