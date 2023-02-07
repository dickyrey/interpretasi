part of 'article_form_bloc.dart';

@freezed
class ArticleFormState with _$ArticleFormState {
  const factory ArticleFormState({
    required RequestState state,
    required String message,
    required bool isSubmit,
    required String id,
    required String title,
    required Delta? delta,
    required String imageUrl,
    required File? imageFile,
    required Category? selectedCategory,
    required List<Category> categoryList,
    required List<String> tagList,
  }) = _ArticleFormState;

  factory ArticleFormState.initial() {
    return const ArticleFormState(
      state: RequestState.empty,
      message: '',
      isSubmit: false,
      id: '',
      title: '',
      delta: null,
      imageUrl: '',
      imageFile: null,
      selectedCategory:null,
      categoryList: [],
      tagList: [],
    );
  }
}
