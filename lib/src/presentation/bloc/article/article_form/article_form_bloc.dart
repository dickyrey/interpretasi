import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/common/enums.dart';
import 'package:interpretasi/src/domain/entities/article_detail.dart';
import 'package:interpretasi/src/domain/entities/category.dart';
import 'package:interpretasi/src/domain/entities/checkbox_state.dart';
import 'package:interpretasi/src/domain/usecases/article/create_article.dart';
import 'package:interpretasi/src/domain/usecases/article/update_article.dart';
import 'package:interpretasi/src/utilities/image_cropper_utils.dart';

part 'article_form_event.dart';
part 'article_form_state.dart';
part 'article_form_bloc.freezed.dart';

class ArticleFormBloc extends Bloc<ArticleFormEvent, ArticleFormState> {
  ArticleFormBloc({
    required this.create,
    required this.update,
  }) : super(ArticleFormState.initial()) {
    on<ArticleFormEvent>((event, emit) async {
      await event.map(
        init: (_) {
          emit(ArticleFormState.initial());
        },
        initialize: (event) async {
          // final toEntity = event.article.categories
          //     .map((e) => CheckBoxState(category: e))
          //     .toList();

          // toEntity.map((e) {
          //   state.categoryList
          //       .firstWhere((x) => x.category.id == e.category.id)
          //       .value = true;
          // }).toList();

          final id = event.article.url.replaceFirst(Const.unusedPath, '');

          emit(
            state.copyWith(
              state: RequestState.empty,
              message: '',
              imageFile: null,
              isSubmit: false,
              id: id,
              title: event.article.title,
              content: event.article.content,
              imageUrl: event.article.image,
            ),
          );
        },
        title: (e) {
          emit(state.copyWith(title: e.val));
        },
        content: (e) {
          emit(state.copyWith(content: e.val));
        },
        pickImage: (e) async {
          final pickedImage = await ImagePicker().pickImage(
            source: e.source,
          );
          if (pickedImage != null) {
            final croppedImage = await ImageCropperUtils.cropImage(
              pickedImage.path,
            );
            if (croppedImage != null) {
              emit(state.copyWith(imageFile: File(croppedImage.path)));
            }
          }
        },
        fetchCategories: (e) {
          final categoryMap = e.categories.map((e) => e).toList();
          emit(
            state.copyWith(
              state: RequestState.empty,
              categoryCheckBoxList: categoryMap
                  .map(
                    (e) => CheckBoxState(category: e),
                  )
                  .toList(),
            ),
          );
        },
        create: (e) async {
          emit(
            state.copyWith(
              state: RequestState.loading,
              isSubmit: true,
            ),
          );
          final selected = state.categoryCheckBoxList
              .where(
                (e) => e.value == true,
              )
              .toList();

          final selectedCategory = selected
              .map(
                (e) => '"${e.category.id}"',
              )
              .toList();

          if (state.imageFile != null) {
            final result = await create.execute(
              title: state.title,
              content: state.content,
              image: state.imageFile!,
              categories: selectedCategory,
            );

            result.fold(
              (f) => emit(
                state.copyWith(
                  state: RequestState.error,
                  isSubmit: false,
                  message: f.message,
                ),
              ),
              (_) => emit(
                state.copyWith(
                  state: RequestState.loaded,
                  isSubmit: true,
                ),
              ),
            );
          }
        },
        update: (e) async {
          emit(
            state.copyWith(
              state: RequestState.loading,
              isSubmit: true,
            ),
          );
          final selected = state.categoryCheckBoxList
              .where(
                (e) => e.value == true,
              )
              .toList();

          final selectedCategory =
              selected.map((e) => '"${e.category.id}"').toList();

          final result = await update.execute(
            id: state.id,
            title: state.title,
            content: state.content,
            imageFile: state.imageFile,
            categories: selectedCategory,
          );

          result.fold(
            (f) => emit(
              state.copyWith(
                state: RequestState.error,
                isSubmit: false,
                message: f.message,
              ),
            ),
            (_) => emit(
              state.copyWith(
                state: RequestState.loaded,
                isSubmit: true,
              ),
            ),
          );
        },
      );
    });
  }
  final CreateArticle create;
  final UpdateArticle update;
}
