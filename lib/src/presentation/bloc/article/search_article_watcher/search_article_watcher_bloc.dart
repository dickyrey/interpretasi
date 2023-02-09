import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interpretasi/src/domain/entities/article.dart';
import 'package:interpretasi/src/domain/usecases/article/get_search_article.dart';
import 'package:rxdart/src/transformers/backpressure/debounce.dart';
import 'package:rxdart/src/transformers/flat_map.dart';

part 'search_article_watcher_bloc.freezed.dart';
part 'search_article_watcher_event.dart';
part 'search_article_watcher_state.dart';

class SearchArticleWatcherBloc
    extends Bloc<SearchArticleWatcherEvent, SearchArticleWatcherState> {
  SearchArticleWatcherBloc(this._search) : super(const _Initial()) {
    on<SearchArticleWatcherEvent>(
      (event, emit) async {
        await event.map(
          search: (event) async {
            emit(const SearchArticleWatcherState.loading());

            final result = await _search.execute(event.query);

            result.fold(
              (f) => emit(SearchArticleWatcherState.error(f.message)),
              (data) => emit(SearchArticleWatcherState.loaded(data)),
            );
          },
        );
      },
      transformer: debounce(const Duration(milliseconds: 500)),
    );
  }
  final GetSearchArticle _search;
}

EventTransformer<MyEvent> debounce<MyEvent>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}
