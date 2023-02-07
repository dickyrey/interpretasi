import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/common/enums.dart';
import 'package:interpretasi/src/domain/entities/article_detail.dart';
import 'package:interpretasi/src/domain/entities/category.dart';
import 'package:interpretasi/src/domain/usecases/article/create_article.dart';
import 'package:interpretasi/src/domain/usecases/article/update_article.dart';
import 'package:interpretasi/src/utilities/image_cropper_utils.dart';
import 'package:vsc_quill_delta_to_html/vsc_quill_delta_to_html.dart';

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

          // toEntity.map((event) {
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
              imageUrl: event.article.image,
            ),
          );
        },
        title: (event) {
          emit(
            state.copyWith(
              title: event.val,
              message: '',
            ),
          );
        },
        pickImage: (event) async {
          final pickedImage = await ImagePicker().pickImage(
            source: event.source,
          );
          if (pickedImage != null) {
            final croppedImage = await ImageCropperUtils.cropImage(
              pickedImage.path,
            );
            if (croppedImage != null) {
              emit(
                state.copyWith(
                  imageFile: File(croppedImage.path),
                  message: '',
                ),
              );
            }
          }
        },
        changeCategory: (event) {
          emit(
            state.copyWith(
              state: RequestState.empty,
              selectedCategory: event.category,
              message: '',
            ),
          );
        },
        fetchCategories: (event) {
          emit(
            state.copyWith(
              state: RequestState.empty,
              categoryList: event.categories,
            ),
          );
        },
        addTags: (event) {
          if (state.tagList.length < 15) {
            final tagList = List<String>.from(state.tagList)..add(event.tag);
            emit(
              state.copyWith(
                state: RequestState.empty,
                tagList: tagList,
                message: '',
              ),
            );
          }
        },
        removeTags: (event) {
          final tagList = List<String>.from(state.tagList)..remove(event.tag);
          emit(
            state.copyWith(
              state: RequestState.empty,
              tagList: tagList,
              message: '',
            ),
          );
        },
        create: (event) async {
          emit(
            state.copyWith(
              state: RequestState.loading,
              isSubmit: true,
            ),
          );

          if (state.imageFile == null) {
            emit(
              state.copyWith(
                state: RequestState.error,
                isSubmit: false,
                message: 'thumbnail-null',
              ),
            );
          } else if (state.title == '') {
            emit(
              state.copyWith(
                state: RequestState.error,
                isSubmit: false,
                message: 'title-null',
              ),
            );
          } else if (state.selectedCategory?.id == null) {
            emit(
              state.copyWith(
                state: RequestState.error,
                isSubmit: false,
                message: 'category-null',
              ),
            );
          } else if (state.tagList.isEmpty) {
            emit(
              state.copyWith(
                state: RequestState.error,
                isSubmit: false,
                message: 'tag-null',
              ),
            );
          } 
          
          final decoded = List<Map<String, dynamic>>.from(event.delta.toJson());
          final html = QuillDeltaToHtmlConverter(decoded);

          if (state.imageFile != null &&
              state.title != '' &&
              state.selectedCategory?.id != null &&
              state.tagList.isNotEmpty) {
            final result = await create.execute(
              categoryId: state.selectedCategory!.id,
              image: state.imageFile!,
              title: state.title,
              content: html.convert(),
              deltaJson: jsonEncode(event.delta.toJson()),
              tags: state.tagList,
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
          // emit(
          //   state.copyWith(
          //     state: RequestState.loading,
          //     isSubmit: true,
          //   ),
          // );
          // final selected = state.categoryCheckBoxList
          //     .where(
          //       (e) => e.value == true,
          //     )
          //     .toList();

          // final selectedCategory =
          //     selected.map((e) => '"${e.category.id}"').toList();

          // final result = await update.execute(
          //   id: state.id,
          //   title: state.title,
          //   content: state.content,
          //   imageFile: state.imageFile,
          //   categories: selectedCategory,
          // );

          // result.fold(
          //   (f) => emit(
          //     state.copyWith(
          //       state: RequestState.error,
          //       isSubmit: false,
          //       message: f.message,
          //     ),
          //   ),
          //   (_) => emit(
          //     state.copyWith(
          //       state: RequestState.loaded,
          //       isSubmit: true,
          //     ),
          //   ),
          // );
        },
      );
    });
  }
  final CreateArticle create;
  final UpdateArticle update;
}
