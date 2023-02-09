import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:interpretasi/src/common/colors.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/common/routes.dart';
import 'package:interpretasi/src/common/screens.dart';
import 'package:interpretasi/src/presentation/bloc/article/latest_article_watcher/latest_article_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/category/category_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/widgets/article_card_widget.dart';

class ExploreArticlePage extends StatefulWidget {
  const ExploreArticlePage({super.key});

  @override
  State<ExploreArticlePage> createState() => _ExploreArticlePageState();
}

class _ExploreArticlePageState extends State<ExploreArticlePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: BlocBuilder<LatestArticleWatcherBloc, LatestArticleWatcherState>(
        builder: (context, state) {
          return state.maybeMap(
            orElse: () {
              return const SizedBox();
            },
            loading: (_) {
              return ListView.builder(
                itemCount: 3,
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return const ArticleCardLoadingWidget();
                },
              );
            },
            loaded: (state) {
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
            },
          );
        },
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;
    final categoryBloc = context.read<CategoryWatcherBloc>().state.categoryList;

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
        child: SizedBox(
          width: Screens.width(context),
          height: 30,
          child: ListView.builder(
            itemCount: categoryBloc.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(left: Const.margin),
            itemBuilder: (context, index) {
              final category = categoryBloc[index];
              return Padding(
                padding: const EdgeInsets.only(right: Const.space12),
                child: InkWell(
                  borderRadius: BorderRadius.circular(Const.space25),
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  child: Chip(
                    backgroundColor: (_selectedIndex == index)
                        ? theme.primaryColor
                        : theme.cardColor,
                    label: Text(
                      category.name,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: (_selectedIndex == index)
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
        ),
      ),
    );
  }
}
