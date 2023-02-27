import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:interpretasi/src/domain/entities/article_detail.dart';
import 'package:interpretasi/src/domain/usecases/article/get_article_detail.dart';

part 'article_detail_watcher_event.dart';
part 'article_detail_watcher_state.dart';
part 'article_detail_watcher_bloc.freezed.dart';

@injectable
class ArticleDetailWatcherBloc extends Bloc<ArticleDetailWatcherEvent, ArticleDetailWatcherState> {
  ArticleDetailWatcherBloc(this._article) : super(const ArticleDetailWatcherState.initial()) {
    on<ArticleDetailWatcherEvent>((event, emit) async {
      await event.map(
        fetch: (event) async {
          emit(const ArticleDetailWatcherState.loading());

          final result = await _article.execute(event.url);

          result.fold(
            (f) => emit(ArticleDetailWatcherState.error(f.message)),
            (data) => emit(ArticleDetailWatcherState.loaded(data)),
          );
        },
      );
    });
  }
  final GetArticleDetail _article;
}
