import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/common/enums.dart';
import 'package:interpretasi/src/common/routes.dart';
import 'package:interpretasi/src/presentation/bloc/article/article_form/article_form_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/article/delete_article_actor/delete_article_actor_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/user_article/moderated_actor/moderated_actor_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/user_article/user_article_banned_watcher/user_article_banned_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/user_article/user_article_drafted_watcher/user_article_drafted_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/user_article/user_article_moderated_watcher/user_article_moderated_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/user_article/user_article_published_watcher/user_article_published_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/user_article/user_article_rejected_watcher/user_article_rejected_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/widgets/article_card_widget.dart';
import 'package:interpretasi/src/presentation/widgets/empty_data_widget.dart';
import 'package:interpretasi/src/utilities/snackbar.dart';
import 'package:interpretasi/src/utilities/toast.dart';

class MyArticlePage extends StatefulWidget {
  const MyArticlePage({super.key});

  @override
  State<MyArticlePage> createState() => _MyArticlePageState();
}

class _MyArticlePageState extends State<MyArticlePage> {
  late ScrollController _drafScrollCtrl;
  late ScrollController _moderatedScrollCtrl;
  late ScrollController _bannedScrollCtrl;

  bool _hasReachedMax = false;

  @override
  void initState() {
    super.initState();
    _drafScrollCtrl = ScrollController();
    _moderatedScrollCtrl = ScrollController();
    _bannedScrollCtrl = ScrollController();
    final moderatedBloc = context.read<UserArticleModeratedWatcherBloc>().state;
    final bannedBloc = context.read<UserArticleBannedWatcherBloc>().state;
    _drafScrollCtrl.addListener(() {
      if (_drafScrollCtrl.position.pixels >=
          _drafScrollCtrl.position.maxScrollExtent) {
        if (_hasReachedMax == false) {
          context.read<UserArticleDraftedWatcherBloc>().add(
                const UserArticleDraftedWatcherEvent.fetch(isRefresh: false),
              );
        }
      }
    });
    _moderatedScrollCtrl.addListener(() {
      if (_moderatedScrollCtrl.position.pixels >=
          _moderatedScrollCtrl.position.maxScrollExtent) {
        if (moderatedBloc.page != null) {
          context
              .read<UserArticleModeratedWatcherBloc>()
              .add(const UserArticleModeratedWatcherEvent.fetch());
        }
      }
    });
    _bannedScrollCtrl.addListener(() {
      if (_bannedScrollCtrl.position.pixels >=
          _bannedScrollCtrl.position.maxScrollExtent) {
        if (bannedBloc.page != null) {
          context
              .read<UserArticleBannedWatcherBloc>()
              .add(const UserArticleBannedWatcherEvent.fetch());
        }
      }
    });
    Future.microtask(
      () => context
          .read<UserArticleDraftedWatcherBloc>()
          .add(const UserArticleDraftedWatcherEvent.fetch(isRefresh: false)),
    );
  }

  @override
  void dispose() {
    _drafScrollCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;

    return MultiBlocListener(
      listeners: [
        BlocListener<DeleteArticleActorBloc, DeleteArticleActorState>(
          listener: (context, state) {
            state.maybeMap(
              orElse: () {},
              error: (_) {
                final snack = showSnackbar(
                  context,
                  type: SnackbarType.error,
                  labelText: lang.failed_to_delete_article_try_again_later,
                  labelButton: lang.close,
                  onTap: () {},
                );
                ScaffoldMessenger.of(context).showSnackBar(snack);
              },
              success: (_) {
                showToast(msg: lang.article_deleted);
                context.read<UserArticleDraftedWatcherBloc>().add(
                      const UserArticleDraftedWatcherEvent.fetch(
                        isRefresh: true,
                      ),
                    );
              },
            );
          },
        ),
        BlocListener<ModeratedActorBloc, ModeratedActorState>(
          listener: (context, state) {
            state.maybeMap(
              orElse: () {},
              error: (_) {
                final snack = showSnackbar(
                  context,
                  type: SnackbarType.error,
                  labelText: lang.failed_to_publish_try_again_later,
                  labelButton: lang.close,
                  onTap: () {},
                );
                ScaffoldMessenger.of(context).showSnackBar(snack);
              },
              success: (_) {
                showToast(msg: lang.articles_are_sent_to_be_checked_by_admin);
                context.read<UserArticleDraftedWatcherBloc>().add(
                      const UserArticleDraftedWatcherEvent.fetch(
                        isRefresh: true,
                      ),
                    );
              },
            );
          },
        ),
      ],
      child: DefaultTabController(
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
                      return EmptyDataWidget(
                        illustration: Assets.write,
                        title: lang.my_articles_empty,
                        subtitle: lang
                            .you_havent_written_any_article_here_yet_lets_write_yours_from_now_on,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            ARTICLE_SEARCH,
                            arguments: false,
                          );
                        },
                      );
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
                      _hasReachedMax = state.hasReachedMax;

                      return RefreshIndicator(
                        onRefresh: () async {
                          context.read<UserArticleDraftedWatcherBloc>().add(
                                const UserArticleDraftedWatcherEvent.fetch(
                                  isRefresh: true,
                                ),
                              );
                        },
                        child: ListView.separated(
                          controller: _drafScrollCtrl,
                          itemCount: state.hasReachedMax
                              ? state.articleList.length
                              : state.articleList.length + 1,
                          padding: const EdgeInsets.symmetric(
                            vertical: Const.margin,
                          ),
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          separatorBuilder: (context, index) {
                            return const SizedBox(height: Const.space15);
                          },
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
                              index: index,
                              article: article,
                              showPreviewButton: true,
                              showEditButton: true,
                              showPublishButton: true,
                              showDeleteButton: true,
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  ARTICLE_PREVIEW,
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
              BlocBuilder<UserArticleModeratedWatcherBloc,
                  UserArticleModeratedWatcherState>(
                builder: (context, state) {
                  switch (state.state) {
                    case RequestState.empty:
                      return EmptyDataWidget(
                        illustration: Assets.write,
                        title: lang.my_articles_empty,
                        subtitle: lang
                            .you_havent_written_any_article_here_yet_lets_write_yours_from_now_on,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            ARTICLE_SEARCH,
                            arguments: false,
                          );
                        },
                      );
                    case RequestState.loading:
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
                    case RequestState.error:
                      // TODO(dickyrey): Error View
                      return const SizedBox();
                    case RequestState.loaded:
                      return RefreshIndicator(
                        onRefresh: () async {
                          context.read<UserArticleModeratedWatcherBloc>().add(
                                const UserArticleModeratedWatcherEvent.fetch(),
                              );
                        },
                        child: ListView.separated(
                          controller: _moderatedScrollCtrl,
                          itemCount: state.articleList.length +
                              (state.page != null ? 1 : 0),
                          padding: const EdgeInsets.symmetric(
                            vertical: Const.margin,
                          ),
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          separatorBuilder: (context, index) {
                            return const SizedBox(height: Const.space15);
                          },
                          itemBuilder: (context, index) {
                            if (index == state.articleList.length &&
                                state.page != null) {
                              return const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            }
                            final article = state.articleList[index];
                            return ArticleCardWidget(
                              index: index,
                              article: article,
                              showPreviewButton: true,
                              showDeleteButton: true,
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  ARTICLE_PREVIEW,
                                  arguments: article,
                                );
                              },
                            );
                          },
                        ),
                      );
                  }
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
                        return RefreshIndicator(
                          onRefresh: () async {
                            context.read<UserArticleRejectedWatcherBloc>().add(
                                  const UserArticleRejectedWatcherEvent.fetch(),
                                );
                          },
                          child: ListView.separated(
                            itemCount: state.articleList.length,
                            padding: const EdgeInsets.symmetric(
                              vertical: Const.margin,
                            ),
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            separatorBuilder: (context, index) {
                              return const SizedBox(height: Const.space15);
                            },
                            itemBuilder: (context, index) {
                              final article = state.articleList[index];
                              return ArticleCardWidget(
                                index: index,
                                article: article,
                                showEditButton: true,
                                showDeleteButton: true,
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    ARTICLE_PREVIEW,
                                    arguments: article,
                                  );
                                },
                              );
                            },
                          ),
                        );
                      }
                      return EmptyDataWidget(
                        illustration: Assets.write,
                        title: lang.my_articles_empty,
                        subtitle: lang
                            .you_havent_written_any_article_here_yet_lets_write_yours_from_now_on,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            ARTICLE_SEARCH,
                            arguments: false,
                          );
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
                        return RefreshIndicator(
                          onRefresh: () async {
                            context.read<UserArticlePublishedWatcherBloc>().add(
                                  const UserArticlePublishedWatcherEvent
                                      .fetch(),
                                );
                          },
                          child: ListView.separated(
                            itemCount: state.articleList.length,
                            padding: const EdgeInsets.symmetric(
                              vertical: Const.margin,
                            ),
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            separatorBuilder: (context, index) {
                              return const SizedBox(height: Const.space15);
                            },
                            itemBuilder: (context, index) {
                              final article = state.articleList[index];
                              return ArticleCardWidget(
                                index: index,
                                article: article,
                                showEditButton: true,
                                showDeleteButton: true,
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    ARTICLE_PREVIEW,
                                    arguments: article,
                                  );
                                },
                              );
                            },
                          ),
                        );
                      }
                      return EmptyDataWidget(
                        illustration: Assets.write,
                        title: lang.my_articles_empty,
                        subtitle: lang
                            .you_havent_written_any_article_here_yet_lets_write_yours_from_now_on,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            ARTICLE_SEARCH,
                            arguments: false,
                          );
                        },
                      );
                    },
                  );
                },
              ),
              BlocBuilder<UserArticleBannedWatcherBloc,
                  UserArticleBannedWatcherState>(
                builder: (context, state) {
                  switch (state.state) {
                    case RequestState.empty:
                      return EmptyDataWidget(
                        illustration: Assets.write,
                        title: lang.my_articles_empty,
                        subtitle: lang
                            .you_havent_written_any_article_here_yet_lets_write_yours_from_now_on,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            ARTICLE_SEARCH,
                            arguments: false,
                          );
                        },
                      );
                    case RequestState.loading:
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
                    case RequestState.error:
                      // TODO(dickyrey): Error View
                      return const SizedBox();
                    case RequestState.loaded:
                      return RefreshIndicator(
                        onRefresh: () async {
                          context.read<UserArticleBannedWatcherBloc>().add(
                                const UserArticleBannedWatcherEvent.fetch(),
                              );
                        },
                        child: ListView.separated(
                          controller: _bannedScrollCtrl,
                          itemCount: state.articleList.length +
                              (state.page != null ? 1 : 0),
                          padding: const EdgeInsets.symmetric(
                            vertical: Const.margin,
                          ),
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          separatorBuilder: (context, index) {
                            return const SizedBox(height: Const.space15);
                          },
                          itemBuilder: (context, index) {
                            if (index == state.articleList.length &&
                                state.page != null) {
                              return const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            }
                            final article = state.articleList[index];
                            return ArticleCardWidget(
                              index: index,
                              article: article,
                              showDeleteButton: true,
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  ARTICLE_PREVIEW,
                                  arguments: article,
                                );
                              },
                            );
                          },
                        ),
                      );
                  }
                  // return state.maybeMap(
                  //   orElse: () {
                  //     // TODO(dickyrey): Error View
                  //     return const SizedBox();
                  //   },
                  //   loading: (_) {
                  //     return ListView.builder(
                  //       itemCount: 3,
                  //       physics: const ScrollPhysics(),
                  //       shrinkWrap: true,
                  //       padding: const EdgeInsets.symmetric(
                  //         vertical: Const.margin,
                  //       ),
                  //       itemBuilder: (context, index) {
                  //         return const ArticleCardLoadingWidget();
                  //       },
                  //     );
                  //   },
                  //   loaded: (state) {
                  //     if (state.articleList.isNotEmpty) {
                  //       return RefreshIndicator(
                  //         onRefresh: () async {
                  //           context.read<UserArticleBannedWatcherBloc>().add(
                  //                 const UserArticleBannedWatcherEvent.fetch(),
                  //               );
                  //         },
                  //         child: ListView.separated(
                  //           itemCount: state.articleList.length,
                  //           padding: const EdgeInsets.symmetric(
                  //             vertical: Const.margin,
                  //           ),
                  //           physics: const ScrollPhysics(),
                  //           shrinkWrap: true,
                  //           separatorBuilder: (context, index) {
                  //             return const SizedBox(height: Const.space15);
                  //           },
                  //           itemBuilder: (context, index) {
                  //             final article = state.articleList[index];
                  //             return ArticleCardWidget(
                  //               index: index,
                  //               article: article,
                  //               showDeleteButton: true,
                  //               onTap: () {
                  //                 Navigator.pushNamed(
                  //                   context,
                  //                   ARTICLE_PREVIEW,
                  //                   arguments: article,
                  //                 );
                  //               },
                  //             );
                  //           },
                  //         ),
                  //       );
                  //     }
                  //     return EmptyDataWidget(
                  //       illustration: Assets.write,
                  //       title: lang.my_articles_empty,
                  //       subtitle: lang
                  //           .you_havent_written_any_article_here_yet_lets_write_yours_from_now_on,
                  //       onTap: () {
                  //         Navigator.pushNamed(
                  //           context,
                  //           ARTICLE_SEARCH,
                  //           arguments: false,
                  //         );
                  //       },
                  //     );
                  //   },
                  // );
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
          color: theme.iconTheme.color,
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
        labelColor: theme.primaryColor,
        unselectedLabelColor: theme.hintColor,
        labelStyle: theme.textTheme.labelSmall,
        unselectedLabelStyle: theme.textTheme.bodyLarge,
        indicatorSize: TabBarIndicatorSize.tab,
        isScrollable: true,
        onTap: (index) async {
          if (index == 0) {
            final state = context.read<UserArticleDraftedWatcherBloc>().state;
            if (state.runtimeType !=
                UserArticleDraftedWatcherState.loaded.runtimeType) {
              context.read<UserArticleDraftedWatcherBloc>().add(
                    const UserArticleDraftedWatcherEvent.fetch(isRefresh: true),
                  );
            }
          } else if (index == 1) {
            final state = context.read<UserArticleModeratedWatcherBloc>().state;
            if (state.state != RequestState.loaded) {
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
            if (state.state != RequestState.loaded) {
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
