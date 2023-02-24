import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interpretasi/src/domain/entities/article.dart';
import 'package:interpretasi/src/domain/usecases/user_article/history_article.dart';

part 'read_history_watcher_event.dart';
part 'read_history_watcher_state.dart';
part 'read_history_watcher_bloc.freezed.dart';

class ReadHistoryWatcherBloc
    extends Bloc<ReadHistoryWatcherEvent, ReadHistoryWatcherState> {
  ReadHistoryWatcherBloc(this._history) : super(const _Initial()) {
    on<ReadHistoryWatcherEvent>((event, emit) async {
      await event.map(
        init: (_) {
          page = 1;
          localArticleList.clear();
          emit(const ReadHistoryWatcherState.initial());
        },
        fetch: (event) async {
          if (event.isRefresh == true) {
            page = 1;
            localArticleList.clear();
          }
          if (page == 1) {
            emit(const ReadHistoryWatcherState.loading());
          }
          final result = await _history.execute(page);
          result.fold(
            (f) => emit(ReadHistoryWatcherState.error(f.message)),
            (data) {
              if (data.isNotEmpty) {
                if (data.length < 5) {
                  final list = List.of(localArticleList)..addAll(data);
                  emit(
                    ReadHistoryWatcherState.loaded(
                      hasReachedMax: true,
                      articleList: list,
                    ),
                  );
                  localArticleList.addAll(data);
                } else {
                  page += 1;
                  final list = List.of(localArticleList)..addAll(data);
                  emit(
                    ReadHistoryWatcherState.loaded(
                      hasReachedMax: false,
                      articleList: list,
                    ),
                  );
                  localArticleList.addAll(data);
                }
              } else {
                emit(
                  ReadHistoryWatcherState.loaded(
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

  final ReadHistory _history;
}
