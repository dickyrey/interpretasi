import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:interpretasi/src/common/colors.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/common/enums.dart';
import 'package:interpretasi/src/common/screens.dart';
import 'package:interpretasi/src/presentation/bloc/article/latest_article_watcher/latest_article_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/user/user_watcher/user_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/widgets/article_card_widget.dart';
import 'package:interpretasi/src/presentation/widgets/shimmer_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.background,
        title: Text(
          lang.interpretasi,
          style: theme.textTheme.headlineMedium,
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(FeatherIcons.search),
            color: ColorLight.fontTitle,
          ),
          BlocBuilder<UserWatcherBloc, UserWatcherState>(
            builder: (context, state) {
              return state.maybeMap(
                orElse: () {
                  return const SizedBox();
                },
                loading: (_) {
                  return ShimmerWidget(
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: theme.disabledColor,
                    ),
                  );
                },
                loaded: (state) {
                  return CircleAvatar(
                    radius: 20,
                    backgroundImage:
                        CachedNetworkImageProvider(state.user.photo),
                    backgroundColor: theme.disabledColor,
                  );
                },
              );
            },
          ),
          const SizedBox(width: Const.margin),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: Const.space15),
            _HeadingTile(
              label: lang.trending_news,
              onTap: () {
                // TODO(dickyrey): Hottest https://github.com/dickyrey/interpretasi/issues/6
              },
            ),
            const SizedBox(height: Const.space8),
            BlocBuilder<LatestArticleWatcherBloc, LatestArticleWatcherState>(
              builder: (context, state) {
                return state.maybeMap(
                  orElse: () {
                    return const SizedBox();
                  },
                  loading: (_) {
                    return SizedBox(
                      width: Screens.width(context),
                      height: 300,
                      child: ListView.builder(
                        itemCount: 3,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.only(left: Const.margin),
                        itemBuilder: (context, index) {
                          return const ArticleCardLoadingWidget(
                            align: CardAlignment.horizontal,
                          );
                        },
                      ),
                    );
                  },
                  loaded: (state) {
                    return SizedBox(
                      width: Screens.width(context),
                      height: 300,
                      child: ListView.builder(
                        itemCount: state.articleList.length,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.only(left: Const.margin),
                        itemBuilder: (context, index) {
                          final article = state.articleList[index];

                          return ArticleCardWidget(
                            article: article,
                            index: index,
                            align: CardAlignment.horizontal,
                            onTap: () {
                              // TODO(dickyrey): https://github.com/dickyrey/interpretasi/issues/5
                            },
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
            const SizedBox(height: Const.space15),
            _HeadingTile(
              label: lang.explore,
              onTap: () {
                // TODO(dickyrey): https://github.com/dickyrey/interpretasi/issues/7
              },
            ),
            const SizedBox(height: Const.space8),
            BlocBuilder<LatestArticleWatcherBloc, LatestArticleWatcherState>(
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
                      itemBuilder: (context, index) {
                        final article = state.articleList[index];

                        return ArticleCardWidget(
                          article: article,
                          index: index,
                          onTap: () {
                            // TODO(dickyrey): https://github.com/dickyrey/interpretasi/issues/5
                          },
                        );
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _HeadingTile extends StatelessWidget {
  const _HeadingTile({
    required this.label,
    required this.onTap,
  });

  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Const.margin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: theme.textTheme.labelLarge,
          ),
          InkWell(
            onTap: onTap,
            child: Text(
              lang.see_all,
              style: theme.textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
