import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:interpretasi/src/common/colors.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/common/routes.dart';
import 'package:interpretasi/src/presentation/bloc/article/article_form/article_form_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/user_article/user_article_banned_watcher/user_article_banned_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/user_article/user_article_drafted_watcher/user_article_drafted_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/user_article/user_article_moderated_watcher/user_article_moderated_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/user_article/user_article_published_watcher/user_article_published_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/user_article/user_article_rejected_watcher/user_article_rejected_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/widgets/article_card_widget.dart';
import 'package:interpretasi/src/presentation/widgets/empty_data_widget.dart';
import 'package:interpretasi/src/presentation/widgets/outlined_button_widget.dart';

class MyArticlePage extends StatefulWidget {
  const MyArticlePage({super.key});

  @override
  State<MyArticlePage> createState() => _MyArticlePageState();
}

class _MyArticlePageState extends State<MyArticlePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context
          .read<UserArticleDraftedWatcherBloc>()
          .add(const UserArticleDraftedWatcherEvent.fetch()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: _appBar(context),
        body: TabBarView(
          children: [
            BlocBuilder<UserArticleDraftedWatcherBloc,
                UserArticleDraftedWatcherState>(
              builder: (context, state) {
                return state.maybeMap(
                  orElse: () {
                    // TODO(dickyrey): Error View
                    return const SizedBox();
                  },
                  loading: (_) {
                    return ListView.builder(
                      itemCount: 3,
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(
                        vertical: Const.margin,
                      ),
                      itemBuilder: (context, index) {
                        return const ArticleCardLoadingWidget();
                      },
                    );
                  },
                  loaded: (state) {
                    if (state.articleList.isNotEmpty) {
                      return ListView.separated(
                        itemCount: state.articleList.length,
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (context, index) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: Const.margin,
                            ),
                            child: Divider(),
                          );
                        },
                        itemBuilder: (context, index) {
                          return ArticleCardWidget(
                            index: index,
                            article: state.articleList[index],
                            onTap: () {
                              // TODO(dickyrey): https://github.com/dickyrey/interpretasi/issues/14
                            },
                          );
                        },
                      );
                    }
                    return EmptyDataWidget(
                      illustration: Assets.write,
                      title: lang.my_articles_empty,
                      subtitle: lang
                          .you_havent_written_any_article_here_yet_lets_write_yours_from_now_on,
                      onTap: () {
                        // TODO(dickyrey): https://github.com/dickyrey/interpretasi/issues/12
                      },
                    );
                  },
                );
              },
            ),
            BlocBuilder<UserArticleModeratedWatcherBloc,
                UserArticleModeratedWatcherState>(
              builder: (context, state) {
                return state.maybeMap(
                  orElse: () {
                    // TODO(dickyrey): Error View
                    return const SizedBox();
                  },
                  loading: (_) {
                    return ListView.builder(
                      itemCount: 3,
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(
                        vertical: Const.margin,
                      ),
                      itemBuilder: (context, index) {
                        return const ArticleCardLoadingWidget();
                      },
                    );
                  },
                  loaded: (state) {
                    if (state.articleList.isNotEmpty) {
                      return ListView.separated(
                        itemCount: state.articleList.length,
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (context, index) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: Const.margin,
                            ),
                            child: Divider(),
                          );
                        },
                        itemBuilder: (context, index) {
                          return ArticleCardWidget(
                            index: index,
                            article: state.articleList[index],
                            onTap: () {
                              // TODO(dickyrey): https://github.com/dickyrey/interpretasi/issues/14
                            },
                          );
                        },
                      );
                    }
                    return EmptyDataWidget(
                      illustration: Assets.write,
                      title: lang.my_articles_empty,
                      subtitle: lang
                          .you_havent_written_any_article_here_yet_lets_write_yours_from_now_on,
                      onTap: () {
                        // TODO(dickyrey): https://github.com/dickyrey/interpretasi/issues/12
                      },
                    );
                  },
                );
              },
            ),
            BlocBuilder<UserArticleRejectedWatcherBloc,
                UserArticleRejectedWatcherState>(
              builder: (context, state) {
                return state.maybeMap(
                  orElse: () {
                    // TODO(dickyrey): Error View
                    return const SizedBox();
                  },
                  loading: (_) {
                    return ListView.builder(
                      itemCount: 3,
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(
                        vertical: Const.margin,
                      ),
                      itemBuilder: (context, index) {
                        return const ArticleCardLoadingWidget();
                      },
                    );
                  },
                  loaded: (state) {
                    if (state.articleList.isNotEmpty) {
                      return ListView.separated(
                        itemCount: state.articleList.length,
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (context, index) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: Const.margin,
                            ),
                            child: Divider(),
                          );
                        },
                        itemBuilder: (context, index) {
                          return ArticleCardWidget(
                            index: index,
                            article: state.articleList[index],
                            onTap: () {
                              // TODO(dickyrey): https://github.com/dickyrey/interpretasi/issues/14
                            },
                          );
                        },
                      );
                    }
                    return EmptyDataWidget(
                      illustration: Assets.write,
                      title: lang.my_articles_empty,
                      subtitle: lang
                          .you_havent_written_any_article_here_yet_lets_write_yours_from_now_on,
                      onTap: () {
                        // TODO(dickyrey): https://github.com/dickyrey/interpretasi/issues/12
                      },
                    );
                  },
                );
              },
            ),
            BlocBuilder<UserArticlePublishedWatcherBloc,
                UserArticlePublishedWatcherState>(
              builder: (context, state) {
                return state.maybeMap(
                  orElse: () {
                    // TODO(dickyrey): Error View
                    return const SizedBox();
                  },
                  loading: (_) {
                    return ListView.builder(
                      itemCount: 3,
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(
                        vertical: Const.margin,
                      ),
                      itemBuilder: (context, index) {
                        return const ArticleCardLoadingWidget();
                      },
                    );
                  },
                  loaded: (state) {
                    if (state.articleList.isNotEmpty) {
                      return ListView.separated(
                        itemCount: state.articleList.length,
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (context, index) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: Const.margin,
                            ),
                            child: Divider(),
                          );
                        },
                        itemBuilder: (context, index) {
                          return ArticleCardWidget(
                            index: index,
                            article: state.articleList[index],
                            onTap: () {
                              // TODO(dickyrey): https://github.com/dickyrey/interpretasi/issues/14
                            },
                          );
                        },
                      );
                    }
                    return EmptyDataWidget(
                      illustration: Assets.write,
                      title: lang.my_articles_empty,
                      subtitle: lang
                          .you_havent_written_any_article_here_yet_lets_write_yours_from_now_on,
                      onTap: () {
                        // TODO(dickyrey): https://github.com/dickyrey/interpretasi/issues/12
                      },
                    );
                  },
                );
              },
            ),
            BlocBuilder<UserArticleBannedWatcherBloc,
                UserArticleBannedWatcherState>(
              builder: (context, state) {
                return state.maybeMap(
                  orElse: () {
                    // TODO(dickyrey): Error View
                    return const SizedBox();
                  },
                  loading: (_) {
                    return ListView.builder(
                      itemCount: 3,
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(
                        vertical: Const.margin,
                      ),
                      itemBuilder: (context, index) {
                        return const ArticleCardLoadingWidget();
                      },
                    );
                  },
                  loaded: (state) {
                    if (state.articleList.isNotEmpty) {
                      return ListView.separated(
                        itemCount: state.articleList.length,
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (context, index) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: Const.margin,
                            ),
                            child: Divider(),
                          );
                        },
                        itemBuilder: (context, index) {
                          return ArticleCardWidget(
                            index: index,
                            article: state.articleList[index],
                            onTap: () {
                              // TODO(dickyrey): https://github.com/dickyrey/interpretasi/issues/14
                            },
                          );
                        },
                      );
                    }
                    return EmptyDataWidget(
                      illustration: Assets.write,
                      title: lang.my_articles_empty,
                      subtitle: lang
                          .you_havent_written_any_article_here_yet_lets_write_yours_from_now_on,
                      onTap: () {
                        // TODO(dickyrey): https://github.com/dickyrey/interpretasi/issues/12
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

  AppBar _appBar(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

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
        lang.my_articles,
        style: theme.textTheme.headlineSmall,
      ),
      actions: [
        IconButton(
          icon: const Icon(FeatherIcons.plus),
          onPressed: () {
            context.read<ArticleFormBloc>().add(const ArticleFormEvent.init());
            Navigator.pushNamed(
              context,
              ARTICLE_FORM,
              arguments: false,
            );
          },
          splashRadius: 25,
        ),
      ],
      bottom: TabBar(
        labelStyle: theme.textTheme.headlineSmall,
        labelColor: ColorLight.fontTitle,
        unselectedLabelColor: ColorLight.fontSubtitle,
        isScrollable: true,
        onTap: (index) async {
          if (index == 0) {
            final state = context.read<UserArticleDraftedWatcherBloc>().state;
            if (state != const UserArticleDraftedWatcherState.loaded([])) {
              context
                  .read<UserArticleDraftedWatcherBloc>()
                  .add(const UserArticleDraftedWatcherEvent.fetch());
            }
          } else if (index == 1) {
            final state = context.read<UserArticleModeratedWatcherBloc>().state;
            if (state != const UserArticleModeratedWatcherState.loaded([])) {
              context
                  .read<UserArticleModeratedWatcherBloc>()
                  .add(const UserArticleModeratedWatcherEvent.fetch());
            }
          } else if (index == 2) {
            final state = context.read<UserArticleRejectedWatcherBloc>().state;
            if (state != const UserArticleRejectedWatcherState.loaded([])) {
              context
                  .read<UserArticleRejectedWatcherBloc>()
                  .add(const UserArticleRejectedWatcherEvent.fetch());
            }
          } else if (index == 3) {
            final state = context.read<UserArticlePublishedWatcherBloc>().state;
            if (state != const UserArticlePublishedWatcherState.loaded([])) {
              context
                  .read<UserArticlePublishedWatcherBloc>()
                  .add(const UserArticlePublishedWatcherEvent.fetch());
            }
          } else if (index == 4) {
            final state = context.read<UserArticleBannedWatcherBloc>().state;
            if (state != const UserArticleBannedWatcherState.loaded([])) {
              context
                  .read<UserArticleBannedWatcherBloc>()
                  .add(const UserArticleBannedWatcherEvent.fetch());
            }
          }
        },
        tabs: [
          Tab(text: lang.draft),
          Tab(text: lang.moderated),
          Tab(text: lang.rejected),
          Tab(text: lang.published),
          Tab(text: lang.banned),
        ],
      ),
    );
  }
}
