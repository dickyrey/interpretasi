part of 'article_form_bloc.dart';

@freezed
class ArticleFormState with _$ArticleFormState {
  const factory ArticleFormState({
    required RequestState state,
    required String message,
    required bool isSubmit,
    required String id,
    required String title,
    required String content,
    required String imageUrl,
    required File? imageFile,
    required List<CheckBoxState> categoryCheckBoxList,
  }) = _ArticleFormState;

  factory ArticleFormState.initial() {
    return const ArticleFormState(
      state: RequestState.empty,
      message: '',
      isSubmit: false,
      id: '',
      title: '',
      content: '',
      imageUrl: '',
      imageFile: null,
      categoryCheckBoxList: [],
    );
  }
}
