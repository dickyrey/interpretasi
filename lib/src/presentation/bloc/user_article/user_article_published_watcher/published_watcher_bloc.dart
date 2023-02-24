import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interpretasi/src/domain/entities/article.dart';
import 'package:interpretasi/src/domain/usecases/user_article/get_published_article.dart';

part 'published_watcher_event.dart';
part 'published_watcher_state.dart';
part 'published_watcher_bloc.freezed.dart';

class PublishedWatcherBloc
    extends Bloc<PublishedWatcherEvent, PublishedWatcherState> {
  PublishedWatcherBloc(this._article)
      : super(const PublishedWatcherState.initial()) {
    on<PublishedWatcherEvent>((event, emit) async {
      await event.map(
        fetch: (event) async {
          if (event.isRefresh == true) {
            page = 1;
            localArticleList.clear();
          }
          if (page == 1) {
            emit(const PublishedWatcherState.loading());
          }
          final result = await _article.execute(page);
          result.fold(
            (f) => emit(PublishedWatcherState.error(f.message)),
            (data) {
              if (data.isNotEmpty) {
                if (data.length < 5) {
                  final list = List.of(localArticleList)..addAll(data);
                  emit(
                    PublishedWatcherState.loaded(
                      hasReachedMax: true,
                      articleList: list,
                    ),
                  );
                  localArticleList.addAll(data);
                } else {
                  page += 1;
                  final list = List.of(localArticleList)..addAll(data);
                  emit(
                    PublishedWatcherState.loaded(
                      hasReachedMax: false,
                      articleList: list,
                    ),
                  );
                  localArticleList.addAll(data);
                }
              } else {
                emit(
                  PublishedWatcherState.loaded(
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
  final GetPublishedArticle _article;
}
