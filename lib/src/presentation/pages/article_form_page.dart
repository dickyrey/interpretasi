import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:image_picker/image_picker.dart';
import 'package:interpretasi/src/common/colors.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/common/enums.dart';
import 'package:interpretasi/src/presentation/bloc/article/article_form/article_form_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/category/category_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/widgets/elevated_button_widget.dart';
import 'package:interpretasi/src/presentation/widgets/text_field_widget.dart';
import 'package:interpretasi/src/presentation/widgets/text_form_field_widget.dart';
import 'package:interpretasi/src/utilities/snackbar.dart';
import 'package:tuple/tuple.dart';

class ArticleFormPage extends StatefulWidget {
  const ArticleFormPage({super.key, required this.isEdit});

  final bool isEdit;

  @override
  State<ArticleFormPage> createState() => _ArticleFormPageState();
}

class _ArticleFormPageState extends State<ArticleFormPage> {
  final _quillCtrl = QuillController.basic();
  final FocusNode _focusNode = FocusNode();
  final ScrollController _scrollCtrl = ScrollController();
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleCtrl;
  late TextEditingController _tagCtrl;
  PageController _pageCtrl = PageController();
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    final state = context.read<CategoryWatcherBloc>().state.categoryList;
    context
        .read<ArticleFormBloc>()
        .add(ArticleFormEvent.fetchCategories(state));

    _pageCtrl = PageController(initialPage: _selectedIndex);
    _titleCtrl = TextEditingController();
    _tagCtrl = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;

    return BlocListener<ArticleFormBloc, ArticleFormState>(
      listener: (context, state) {
        if (state.message == 'thumbnail-null') {
          final snack = showSnackbar(
            context,
            type: SnackbarType.error,
            labelText: 'Please select thumbnail',
            labelButton: lang.close,
            onTap: () {},
          );
          ScaffoldMessenger.of(context).showSnackBar(snack);
        } else if (state.message == 'title-null') {
          final snack = showSnackbar(
            context,
            type: SnackbarType.error,
            labelText: 'Please write a title',
            labelButton: lang.close,
            onTap: () {},
          );
          ScaffoldMessenger.of(context).showSnackBar(snack);
        } else if (state.message == 'category-null') {
          final snack = showSnackbar(
            context,
            type: SnackbarType.error,
            labelText: 'Please fill select a category',
            labelButton: lang.close,
            onTap: () {},
          );
          ScaffoldMessenger.of(context).showSnackBar(snack);
        } else if (state.message == 'tag-null') {
          final snack = showSnackbar(
            context,
            type: SnackbarType.error,
            labelText: 'Please fill tag',
            labelButton: lang.close,
            onTap: () {},
          );
          ScaffoldMessenger.of(context).showSnackBar(snack);
        } else if (state.message == 'content-null') {
          final snack = showSnackbar(
            context,
            type: SnackbarType.error,
            labelText: 'Please write a content',
            labelButton: lang.close,
            onTap: () {},
          );
          ScaffoldMessenger.of(context).showSnackBar(snack);
        } else if (state.state == RequestState.loaded) {
          final snack = showSnackbar(
            context,
            type: SnackbarType.success,
            labelText: 'Success to upload',
            labelButton: lang.close,
            onTap: () {},
          );
          ScaffoldMessenger.of(context).showSnackBar(snack);
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: _appBar(context),
        body: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: PageView(
            controller: _pageCtrl,
            onPageChanged: (v) {
              setState(() {
                _selectedIndex = v;
              });
            },
            children: [
              DetailsWidget(
                titleCtrl: _titleCtrl,
                tagCtrl: _tagCtrl,
              ),
              _EditorWidget(
                controller: _quillCtrl,
                focusNode: _focusNode,
                scrollController: _scrollCtrl,
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;
    final state = context.read<ArticleFormBloc>().state;

    return AppBar(
      backgroundColor: theme.colorScheme.background,
      elevation: .5,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(
          FeatherIcons.arrowLeft,
          color: theme.iconTheme.color,
        ),
      ),
      title: Row(
        children: [
          Expanded(
            child: QuillToolbar.basic(
              controller: _quillCtrl,
              toolbarIconSize: 23,
              showFontFamily: false,
              showBackgroundColorButton: false,
              showBoldButton: false,
              showCenterAlignment: false,
              showClearFormat: false,
              showCodeBlock: false,
              showColorButton: false,
              showDividers: false,
              showFontSize: false,
              showHeaderStyle: false,
              showIndent: false,
              showInlineCode: false,
              showItalicButton: false,
              showJustifyAlignment: false,
              showLeftAlignment: false,
              showLink: false,
              showListBullets: false,
              showListCheck: false,
              showListNumbers: false,
              showQuote: false,
              showRightAlignment: false,
              showSearchButton: false,
              showStrikeThrough: false,
              showUnderLineButton: false,
            ),
          ),
          const Spacer(),
          ElevatedButtonWidget(
            width: 80,
            height: 30,
            isLoading: (state.isSubmit == true) ? true : false,
            label: (_selectedIndex == 0) ? lang.next : lang.save,
            onTap: () {
              if (_selectedIndex == 0) {
                _pageCtrl.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
              } else {
                final delta = _quillCtrl.document.toDelta();
                context
                    .read<ArticleFormBloc>()
                    .add(ArticleFormEvent.create(delta));
              }
            },
          )
        ],
      ),
      centerTitle: false,
    );
  }
}

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({
    super.key,
    required this.titleCtrl,
    required this.tagCtrl,
  });

  final TextEditingController titleCtrl;
  final TextEditingController tagCtrl;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return BlocBuilder<ArticleFormBloc, ArticleFormState>(
      builder: (context, state) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(Const.margin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(Const.radius),
                onTap: () => context
                    .read<ArticleFormBloc>()
                    .add(const ArticleFormEvent.pickImage(ImageSource.gallery)),
                child: AspectRatio(
                  aspectRatio: 16 / 10,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: theme.disabledColor),
                      borderRadius: BorderRadius.circular(Const.radius),
                      image: (state.imageFile != null)
                          ? DecorationImage(
                              image: FileImage(state.imageFile!),
                              fit: BoxFit.contain,
                            )
                          : (state.imageUrl != '')
                              ? DecorationImage(
                                  image: CachedNetworkImageProvider(
                                    state.imageUrl,
                                  ),
                                )
                              : null,
                    ),
                    child: (state.imageFile != null || state.imageUrl != '')
                        ? const SizedBox()
                        : Text(
                            lang.upload_thumbnail,
                            style: theme.textTheme.bodyLarge,
                          ),
                  ),
                ),
              ),
              const SizedBox(height: Const.space15),
              Text(
                lang.your_awesome_title,
                style: theme.textTheme.titleMedium,
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: Const.space8),
              TextFormFieldWidget(
                controller: titleCtrl,
                maxLines: null,
                hintText: lang.ten_ways_to_explore_this_world,
                onChanged: (v) {
                  context
                      .read<ArticleFormBloc>()
                      .add(ArticleFormEvent.title(v));
                },
              ),
              const SizedBox(height: Const.space15),
              Text(
                lang.choose_a_category,
                style: theme.textTheme.titleMedium,
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: Const.space8),
              DropdownButtonHideUnderline(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: Const.space12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Const.radius),
                    border: Border.all(
                      color: theme.disabledColor,
                    ),
                  ),
                  child: DropdownButton(
                    value: state.selectedCategory,
                    isExpanded: true,
                    dropdownColor: theme.cardColor,
                    borderRadius: BorderRadius.circular(Const.radius),
                    style: theme.textTheme.bodyMedium,
                    hint: Text(
                      lang.select_category,
                      style: theme.textTheme.titleMedium,
                    ),
                    items: state.categoryList.map((category) {
                      return DropdownMenuItem(
                        value: category,
                        child: Text(
                          category.name,
                          style: theme.textTheme.titleMedium,
                        ),
                      );
                    }).toList(),
                    onChanged: (v) {
                      context
                          .read<ArticleFormBloc>()
                          .add(ArticleFormEvent.changeCategory(v!));
                    },
                  ),
                ),
              ),
              const SizedBox(height: Const.space15),
              Text(
                lang.related_tags,
                style: theme.textTheme.titleMedium,
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: Const.space8),
              TextFieldWidget(
                controller: tagCtrl,
                onSubmitted: (v) {
                  context
                      .read<ArticleFormBloc>()
                      .add(ArticleFormEvent.addTags(v));
                  tagCtrl.clear();
                },
                hintText: lang.your_tags,
              ),
              const SizedBox(height: Const.space8),
              Wrap(
                children: state.tagList.map((tag) {
                  return Padding(
                    padding: const EdgeInsets.only(right: Const.space8),
                    child: Chip(
                      labelPadding: const EdgeInsets.symmetric(
                        horizontal: Const.space8,
                      ),
                      label: Text(tag),
                      onDeleted: () {
                        context
                            .read<ArticleFormBloc>()
                            .add(ArticleFormEvent.removeTags(tag));
                      },
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _EditorWidget extends StatelessWidget {
  const _EditorWidget({
    required this.controller,
    required this.focusNode,
    required this.scrollController,
  });

  final QuillController controller;
  final FocusNode focusNode;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(Const.margin),
            child: QuillEditor(
              controller: controller,
              readOnly: false,
              focusNode: focusNode,
              scrollController: scrollController,
              scrollable: true,
              padding: EdgeInsets.zero,
              autoFocus: false,
              expands: false,
              onImagePaste: (imageBytes) async {
                return '';
              },
              customStyles: DefaultStyles(
                color: ColorLight.fontTitle,
                h1: DefaultTextBlockStyle(
                  theme.textTheme.headlineLarge!,
                  const Tuple2(2, 0),
                  const Tuple2(0, 0),
                  null,
                ),
                h2: DefaultTextBlockStyle(
                  theme.textTheme.headlineMedium!,
                  const Tuple2(2, 0),
                  const Tuple2(0, 0),
                  null,
                ),
                h3: DefaultTextBlockStyle(
                  theme.textTheme.headlineSmall!,
                  const Tuple2(2, 0),
                  const Tuple2(0, 0),
                  null,
                ),
                paragraph: DefaultTextBlockStyle(
                  theme.textTheme.titleLarge!,
                  const Tuple2(2, 0),
                  const Tuple2(0, 0),
                  null,
                ),
              ),
            ),
          ),
        ),
        QuillToolbar.basic(
          controller: controller,
          toolbarIconSize: 23,
          showClearFormat: false,
          showListCheck: false,
          customButtons: [
            QuillCustomButton(
              icon: FeatherIcons.image,
              onTap: (){},
            ),
          ],
          showBackgroundColorButton: false,
          showSearchButton: false,
          multiRowsDisplay: false,
          showRedo: false,
          showStrikeThrough: false,
          showFontFamily: false,
          showUndo: false,
          showFontSize: false,
        )
      ],
    );
  }
}
