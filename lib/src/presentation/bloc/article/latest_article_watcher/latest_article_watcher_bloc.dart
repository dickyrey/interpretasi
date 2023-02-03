import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interpretasi/src/domain/entities/article.dart';
import 'package:interpretasi/src/domain/usecases/article/get_latest_article.dart';

part 'latest_article_watcher_event.dart';
part 'latest_article_watcher_state.dart';
part 'latest_article_watcher_bloc.freezed.dart';

class LatestArticleWatcherBloc extends Bloc<LatestArticleWatcherEvent, LatestArticleWatcherState> {
  LatestArticleWatcherBloc(this._getLatestArticle) : super(const LatestArticleWatcherState.initial()) {
    on<LatestArticleWatcherEvent>((event, emit) async {
      await event.map(
        fetchArticle: (_) async {
          emit(const LatestArticleWatcherState.loading());

          final result = await _getLatestArticle.execute();

          result.fold(
            (f) => emit(LatestArticleWatcherState.error(f.message)),
            (data) => emit(LatestArticleWatcherState.loaded(data)),
          );
        },
      );
    });
  }

  final GetLatestArticle _getLatestArticle;
  
}
