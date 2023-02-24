import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/common/enums.dart';
import 'package:interpretasi/src/common/routes.dart';
import 'package:interpretasi/src/common/screens.dart';
import 'package:interpretasi/src/presentation/bloc/article/latest_article_watcher/latest_article_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/article/trending_article_watcher/trending_article_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/user/user_watcher/user_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/widgets/article_card_widget.dart';
import 'package:interpretasi/src/presentation/widgets/shimmer_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _trendingScrollCtrl;
  late ScrollController _latestScrollCtrl;

  bool _trendingHasReachedMax = false;
  bool _latestHasReachedMax = false;

  @override
  void initState() {
    super.initState();

    /// [ScrollController] init
    _trendingScrollCtrl = ScrollController();
    _latestScrollCtrl = ScrollController();

    ///  Pagination [Listener]
    _trendingScrollCtrl.addListener(() {
      if (_trendingScrollCtrl.position.pixels >=
          _trendingScrollCtrl.position.maxScrollExtent) {
        if (_trendingHasReachedMax == false) {
          context
              .read<TrendingArticleWatcherBloc>()
              .add(const TrendingArticleWatcherEvent.fetch(isRefresh: false));
        }
      }
    });
    _latestScrollCtrl.addListener(() {
      if (_latestScrollCtrl.position.pixels >=
          _latestScrollCtrl.position.maxScrollExtent) {
        if (_latestHasReachedMax == false) {
          context
              .read<LatestArticleWatcherBloc>()
              .add(const LatestArticleWatcherEvent.fetch(isRefresh: false));
        }
      }
    });

    Future.microtask(() {
      context
          .read<TrendingArticleWatcherBloc>()
          .add(const TrendingArticleWatcherEvent.fetch(isRefresh: false));
      context
          .read<LatestArticleWatcherBloc>()
          .add(const LatestArticleWatcherEvent.fetch(isRefresh: false));
    });
  }

  @override
  void dispose() {
    _trendingScrollCtrl.dispose();
    _latestScrollCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;

    return RefreshIndicator(
      onRefresh: () async {
        context
            .read<TrendingArticleWatcherBloc>()
            .add(const TrendingArticleWatcherEvent.fetch(isRefresh: true));
        context
            .read<LatestArticleWatcherBloc>()
            .add(const LatestArticleWatcherEvent.fetch(isRefresh: true));
      },
      child: Scaffold(
        appBar: _appBar(context),
        body: SingleChildScrollView(
          controller: _latestScrollCtrl,
          child: Column(
            children: [
              const SizedBox(height: Const.space15),
              _HeadingTile(
                label: lang.trending_news,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    ARTICLE_TRENDING,
                  );
                },
              ),
              const SizedBox(height: Const.space8),
              BlocBuilder<TrendingArticleWatcherBloc,
                  TrendingArticleWatcherState>(
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
                      _trendingHasReachedMax = state.hasReachedMax;
                      return SizedBox(
                        width: Screens.width(context),
                        height: 300,
                        child: ListView.builder(
                          controller: _trendingScrollCtrl,
                          itemCount: state.hasReachedMax
                              ? state.articleList.length
                              : state.articleList.length + 1,
                          scrollDirection: Axis.horizontal,
                          physics: const ScrollPhysics(),
                          padding: const EdgeInsets.only(left: Const.margin),
                          itemBuilder: (context, index) {
                            if (index == state.articleList.length &&
                                state.hasReachedMax != true) {
                              return const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            }
                            final article = state.articleList[index];

                            return ArticleCardWidget(
                              article: article,
                              index: index,
                              align: CardAlignment.horizontal,
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
                        ),
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: Const.space15),
              _HeadingTile(
                label: lang.todays_news,
                onTap: () {
                  Navigator.pushNamed(context, EXPLORE_ARTICLE);
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
                      _latestHasReachedMax = state.hasReachedMax;
                      return ListView.builder(
                        // controller: _latestScrollCtrl,
                        itemCount: state.hasReachedMax
                            ? state.articleList.length
                            : state.articleList.length + 1,
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          if (index == state.articleList.length &&
                              state.hasReachedMax != true) {
                            return const Center(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }
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
            ],
          ),
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return AppBar(
      backgroundColor: theme.colorScheme.background,
      title: Text(
        lang.interpretasi,
        style: theme.textTheme.headlineMedium,
      ),
      centerTitle: false,
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, ARTICLE_SEARCH);
          },
          icon: const Icon(FeatherIcons.search),
          color: theme.iconTheme.color,
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
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      PROFILE_DETAIL,
                      arguments: state.user,
                    );
                  },
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage:
                        CachedNetworkImageProvider(state.user.photo),
                    backgroundColor: theme.disabledColor,
                  ),
                );
              },
            );
          },
        ),
        const SizedBox(width: Const.margin),
      ],
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
