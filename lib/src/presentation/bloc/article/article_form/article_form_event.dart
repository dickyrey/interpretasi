part of 'article_form_bloc.dart';

@freezed
class ArticleFormEvent with _$ArticleFormEvent {
  const factory ArticleFormEvent.init() = _Init;
  const factory ArticleFormEvent.initialize(ArticleDetail article) = _Initialize;
  const factory ArticleFormEvent.title(String val) = _Title;
  const factory ArticleFormEvent.content(String val) = _Content;
  const factory ArticleFormEvent.pickImage(ImageSource source) = _PickImage;

  const factory ArticleFormEvent.fetchCategories(List<Category> categories) = _FetchCategories;
  const factory ArticleFormEvent.create() = _Create;
  const factory ArticleFormEvent.update() = _Update;
}
