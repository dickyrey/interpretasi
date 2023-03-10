import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:interpretasi/src/domain/usecases/like_article/check_like_status.dart';
import 'package:interpretasi/src/domain/usecases/like_article/like_article.dart';

part 'like_article_watcher_event.dart';
part 'like_article_watcher_state.dart';
part 'like_article_watcher_bloc.freezed.dart';

@injectable
class LikeArticleWatcherBloc
    extends Bloc<LikeArticleWatcherEvent, LikeArticleWatcherState> {
  LikeArticleWatcherBloc({
    required this.checkLikeStatus,
    required this.likeArticle,
  }) : super(const LikeArticleWatcherState.initial()) {
    on<LikeArticleWatcherEvent>((event, emit) async {
      await event.map(
        fetch: (event) async {
          emit(const LikeArticleWatcherState.unliked());

          final result = await checkLikeStatus.execute(event.id);
          result.fold(
            (_) => emit(const LikeArticleWatcherState.unliked()),
            (data) {
              if (data == true) {
                emit(const LikeArticleWatcherState.liked());
              } else {
                emit(const LikeArticleWatcherState.unliked());
              }
            },
          );
        },
        like: (event) async {
          if (state == const LikeArticleWatcherState.liked()) {
            emit(const LikeArticleWatcherState.unliked());

            final result = await likeArticle.execute(event.id);

            result.fold(
              (_) => emit(const LikeArticleWatcherState.unliked()),
              (_) => emit(const LikeArticleWatcherState.unliked()),
            );
          } else {
            emit(const LikeArticleWatcherState.liked());

            final result = await likeArticle.execute(event.id);

            result.fold(
              (_) => emit(const LikeArticleWatcherState.liked()),
              (_) => emit(const LikeArticleWatcherState.liked()),
            );
          }
        },
      );
    });
  }
  final CheckLikeStatus checkLikeStatus;
  final LikeOrUnlikedArticle likeArticle;
}
