import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:interpretasi/src/domain/entities/article.dart';
import 'package:interpretasi/src/domain/usecases/user_article/get_moderated_article.dart';

part 'moderated_watcher_event.dart';
part 'moderated_watcher_state.dart';
part 'moderated_watcher_bloc.freezed.dart';

@injectable
class ModeratedWatcherBloc extends Bloc<
    ModeratedWatcherEvent, ModeratedWatcherState> {
  ModeratedWatcherBloc(this._article)
      : super(const ModeratedWatcherState.initial()) {
    on<ModeratedWatcherEvent>(
      (event, emit) async {
        await event.map(
          fetch: (event) async {
            if (event.isRefresh == true) {
              page = 1;
              localArticleList.clear();
            }
            if (page == 1) {
              emit(const ModeratedWatcherState.loading());
            }
            final result = await _article.execute(page);
            result.fold(
              (f) => emit(ModeratedWatcherState.error(f.message)),
              (data) {
                if (data.isNotEmpty) {
                  if (data.length < 5) {
                    final list = List.of(localArticleList)..addAll(data);
                    emit(
                      ModeratedWatcherState.loaded(
                        hasReachedMax: true,
                        articleList: list,
                      ),
                    );
                    localArticleList.addAll(data);
                  } else {
                    page += 1;
                    final list = List.of(localArticleList)..addAll(data);
                    emit(
                      ModeratedWatcherState.loaded(
                        hasReachedMax: false,
                        articleList: list,
                      ),
                    );
                    localArticleList.addAll(data);
                  }
                } else {
                  emit(
                    ModeratedWatcherState.loaded(
                      hasReachedMax: true,
                      articleList: localArticleList,
                    ),
                  );
                }
              },
            );
          },
        );
      },
    );
  }
  int page = 1;
  final localArticleList = <Article>[];
  final GetModeratedArticle _article;
}
