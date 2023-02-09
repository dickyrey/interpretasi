part of 'article_by_category_watcher_bloc.dart';

@freezed
class ArticleByCategoryWatcherEvent with _$ArticleByCategoryWatcherEvent {
  const factory ArticleByCategoryWatcherEvent.changeIndex(int index) = _ChangeIndex;
  const factory ArticleByCategoryWatcherEvent.fetch(int id) = _Fetch;
}
