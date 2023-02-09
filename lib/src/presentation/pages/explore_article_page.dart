import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:interpretasi/src/common/colors.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/common/enums.dart';
import 'package:interpretasi/src/common/routes.dart';
import 'package:interpretasi/src/common/screens.dart';
import 'package:interpretasi/src/presentation/bloc/article/article_by_category_watcher/article_by_category_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/category/category_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/widgets/article_card_widget.dart';
import 'package:interpretasi/src/presentation/widgets/empty_data_widget.dart';

class ExploreArticlePage extends StatefulWidget {
  const ExploreArticlePage({super.key});

  @override
  State<ExploreArticlePage> createState() => _ExploreArticlePageState();
}

class _ExploreArticlePageState extends State<ExploreArticlePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () {
        context
            .read<ArticleByCategoryWatcherBloc>()
            .add(const ArticleByCategoryWatcherEvent.fetch(1));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: _appBar(context),
      body: BlocBuilder<ArticleByCategoryWatcherBloc,
          ArticleByCategoryWatcherState>(
        builder: (context, state) {
          if (state.state == RequestState.loading) {
            return ListView.builder(
              itemCount: 3,
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return const ArticleCardLoadingWidget();
              },
            );
          } else if (state.state == RequestState.error) {
            return EmptyDataWidget(
              illustration: Assets.error,
              title: lang.something_went_wrong,
              subtitle: lang
                  .we_encountered_an_error_while_trying_to_connect_to_our_server_please_try_after_some_again,
            );
          } else if (state.state == RequestState.loaded) {
            return ListView.builder(
              itemCount: state.articleList.length,
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: Const.margin),
              itemBuilder: (context, index) {
                final article = state.articleList[index];
                return ArticleCardWidget(
                  article: article,
                  index: index,
                  showShareButton: true,
                  showReportButton: true,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      ARTICLE_DETAIL,
                      arguments: article,
                    );
                  },
                );
              },
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;
    final categoryBloc = context.read<CategoryWatcherBloc>().state;

    return AppBar(
      backgroundColor: theme.colorScheme.background,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(
          FeatherIcons.arrowLeft,
          color: theme.iconTheme.color,
        ),
      ),
      title: Text(
        lang.explore,
        style: theme.textTheme.headlineSmall,
      ),
      bottom: PreferredSize(
        preferredSize: Size(
          Screens.width(context),
          50,
        ),
        child: BlocBuilder<ArticleByCategoryWatcherBloc,
            ArticleByCategoryWatcherState>(
          builder: (context, state) {
            return Container(
              width: Screens.width(context),
              height: 30,
              margin: const EdgeInsets.only(bottom: Const.space12),
              child: ListView.builder(
                itemCount: categoryBloc.categoryList.length,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(left: Const.margin),
                itemBuilder: (context, index) {
                  final category = categoryBloc.categoryList[index];

                  return Padding(
                    padding: const EdgeInsets.only(right: Const.space12),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(Const.space25),
                      onTap: () {
                        context.read<ArticleByCategoryWatcherBloc>().add(
                              ArticleByCategoryWatcherEvent.changeIndex(
                                index,
                              ),
                            );
                        context.read<ArticleByCategoryWatcherBloc>().add(
                              ArticleByCategoryWatcherEvent.fetch(
                                category.id,
                              ),
                            );
                      },
                      child: Chip(
                        backgroundColor: (state.index == index)
                            ? theme.primaryColor
                            : theme.cardColor,
                        label: Text(
                          category.name,
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: (state.index == index)
                                ? Colors.white
                                : ColorLight.fontTitle,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: Const.space12,
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, ARTICLE_SEARCH);
          },
          icon: const Icon(FeatherIcons.search),
          color: ColorLight.fontTitle,
        ),
        const SizedBox(width: Const.space12),
      ],
    );
  }
}
