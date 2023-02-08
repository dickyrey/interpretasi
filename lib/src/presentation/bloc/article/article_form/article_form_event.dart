part of 'article_form_bloc.dart';

@freezed
class ArticleFormEvent with _$ArticleFormEvent {
  const factory ArticleFormEvent.init() = _Init;
  const factory ArticleFormEvent.initialize({
    required Article article,
    required List<Category> categoryList,
  }) = _Initialize;
  const factory ArticleFormEvent.title(String val) = _Title;
  const factory ArticleFormEvent.pickImage(ImageSource source) = _PickImage;

  const factory ArticleFormEvent.changeCategory(Category category) =
      _ChangeCategory;
  const factory ArticleFormEvent.fetchCategories(List<Category> categories) =
      _FetchCategories;

  const factory ArticleFormEvent.addTags(String tag) = _AddTags;
  const factory ArticleFormEvent.removeTags(String tag) = _RemoveTags;

  const factory ArticleFormEvent.create(Delta delta) = _Create;
  const factory ArticleFormEvent.update(Delta delta) = _Update;
}
