import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interpretasi/src/common/const.dart';
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
        fetch: (e) async {
          emit(const ArticleCommentWatcherState.loading());
          final id = e.id.replaceFirst(Const.unusedPath, '');

          final result = await _commentList.execute(id);
          result.fold(
            (f) => emit(ArticleCommentWatcherState.error(f.message)),
            (data) => emit(ArticleCommentWatcherState.loaded(data)),
          );
        },
        refresh: (e) async {
          final id = e.id.replaceFirst(Const.unusedPath, '');
          final result = await _commentList.execute(id);
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
