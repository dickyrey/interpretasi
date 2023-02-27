import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:interpretasi/src/domain/entities/article.dart';
import 'package:interpretasi/src/domain/usecases/user_article/get_banned_article.dart';

part 'banned_watcher_event.dart';
part 'banned_watcher_state.dart';
part 'banned_watcher_bloc.freezed.dart';

@injectable
class BannedWatcherBloc extends Bloc<BannedWatcherEvent, BannedWatcherState> {
  BannedWatcherBloc(this._article) : super(const BannedWatcherState.initial()) {
    on<BannedWatcherEvent>((event, emit) async {
      await event.map(
        fetch: (event) async {
          if (event.isRefresh == true) {
            page = 1;
            localArticleList.clear();
          }
          if (page == 1) {
            emit(const BannedWatcherState.loading());
          }
          final result = await _article.execute(page);
          result.fold(
            (f) => emit(BannedWatcherState.error(f.message)),
            (data) {
              if (data.isNotEmpty) {
                if (data.length < 5) {
                  final list = List.of(localArticleList)..addAll(data);
                  emit(
                    BannedWatcherState.loaded(
                      hasReachedMax: true,
                      articleList: list,
                    ),
                  );
                  localArticleList.addAll(data);
                } else {
                  page += 1;
                  final list = List.of(localArticleList)..addAll(data);
                  emit(
                    BannedWatcherState.loaded(
                      hasReachedMax: false,
                      articleList: list,
                    ),
                  );
                  localArticleList.addAll(data);
                }
              } else {
                emit(
                  BannedWatcherState.loaded(
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
  final GetBannedArticle _article;
}
