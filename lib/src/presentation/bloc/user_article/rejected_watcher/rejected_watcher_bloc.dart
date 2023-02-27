import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:interpretasi/src/domain/entities/article.dart';
import 'package:interpretasi/src/domain/usecases/user_article/get_rejected_article.dart';

part 'rejected_watcher_event.dart';
part 'rejected_watcher_state.dart';
part 'rejected_watcher_bloc.freezed.dart';

@injectable
class RejectedWatcherBloc extends Bloc<
    RejectedWatcherEvent, RejectedWatcherState> {
  RejectedWatcherBloc(this._article)
      : super(const RejectedWatcherState.initial()) {
    on<RejectedWatcherEvent>((event, emit) async {
         await event.map(
        fetch: (event) async {
          if (event.isRefresh == true) {
            page = 1;
            localArticleList.clear();
          }
          if (page == 1) {
            emit(const RejectedWatcherState.loading());
          }
          final result = await _article.execute(page);
          result.fold(
            (f) => emit(RejectedWatcherState.error(f.message)),
            (data) {
              if (data.isNotEmpty) {
                if (data.length < 5) {
                  final list = List.of(localArticleList)..addAll(data);
                  emit(
                    RejectedWatcherState.loaded(
                      hasReachedMax: true,
                      articleList: list,
                    ),
                  );
                  localArticleList.addAll(data);
                } else {
                  page += 1;
                  final list = List.of(localArticleList)..addAll(data);
                  emit(
                    RejectedWatcherState.loaded(
                      hasReachedMax: false,
                      articleList: list,
                    ),
                  );
                  localArticleList.addAll(data);
                }
              } else {
                emit(
                  RejectedWatcherState.loaded(
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
  final GetRejectedArticle _article;
}
