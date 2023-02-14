import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interpretasi/src/domain/entities/comment.dart';
import 'package:interpretasi/src/domain/usecases/comment_article/get_comment_list.dart';

part 'article_comment_watcher_event.dart';
part 'article_comment_watcher_state.dart';
part 'article_comment_watcher_bloc.freezed.dart';

class ArticleCommentWatcherBloc
    extends Bloc<ArticleCommentWatcherEvent, ArticleCommentWatcherState> {
  ArticleCommentWatcherBloc(this._commentList)
      : super(const ArticleCommentWatcherState.initial()) {
    on<ArticleCommentWatcherEvent>((event, emit) async {
      await event.map(
        fetch: (event) async {
          emit(const ArticleCommentWatcherState.loading());

          final result = await _commentList.execute(event.id);
          result.fold(
            (f) => emit(ArticleCommentWatcherState.error(f.message)),
            (data) => emit(ArticleCommentWatcherState.loaded(data)),
          );
        },
        refresh: (event) async {
          final result = await _commentList.execute(event.id);
          result.fold(
            (f) => emit(ArticleCommentWatcherState.error(f.message)),
            (data) => emit(ArticleCommentWatcherState.loaded(data)),
          );
        },
      );
    });
  }
  final GetCommentList _commentList;
}
