import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/common/enums.dart';
import 'package:interpretasi/src/common/routes.dart';
import 'package:interpretasi/src/domain/entities/article.dart';
import 'package:interpretasi/src/presentation/bloc/article/article_form/article_form_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/article/delete_article_actor/delete_article_actor_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/user_article/banned_watcher/banned_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/user_article/drafted_watcher/drafted_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/user_article/moderated_actor/moderated_actor_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/user_article/moderated_watcher/moderated_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/user_article/rejected_watcher/rejected_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/user_article/user_article_published_watcher/published_watcher_bloc.dart';
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
  late ScrollController _rejectedScrollCtrl;
  late ScrollController _publishedScrollCtrl;
  late ScrollController _bannedScrollCtrl;

  bool _hasReachedMax = false;

  @override
  void initState() {
    super.initState();

    /// [ScrollController] init
    _drafScrollCtrl = ScrollController();
    _moderatedScrollCtrl = ScrollController();
    _rejectedScrollCtrl = ScrollController();
    _publishedScrollCtrl = ScrollController();
    _bannedScrollCtrl = ScrollController();

    ///  Pagination [Listener]
    //* Draf Article ListView
    _drafScrollCtrl.addListener(() {
      if (_drafScrollCtrl.position.pixels >=
          _drafScrollCtrl.position.maxScrollExtent) {
        if (_hasReachedMax == false) {
          context
              .read<DraftedWatcherBloc>()
              .add(const DraftedWatcherEvent.fetch(isRefresh: false));
        }
      }
    });

    //* Moderated Article ListView
    _moderatedScrollCtrl.addListener(() {
      if (_moderatedScrollCtrl.position.pixels >=
          _moderatedScrollCtrl.position.maxScrollExtent) {
        if (_hasReachedMax == false) {
          context.read<ModeratedWatcherBloc>().add(
                const ModeratedWatcherEvent.fetch(isRefresh: false),
              );
        }
      }
    });

    //* Rejected Article ListView
    _rejectedScrollCtrl.addListener(() {
      if (_rejectedScrollCtrl.position.pixels >=
          _rejectedScrollCtrl.position.maxScrollExtent) {
        if (_hasReachedMax == false) {
          context.read<RejectedWatcherBloc>().add(
                const RejectedWatcherEvent.fetch(isRefresh: false),
              );
        }
      }
    });

    //* Published Article ListView
    _publishedScrollCtrl.addListener(() {
      if (_publishedScrollCtrl.position.pixels >=
          _publishedScrollCtrl.position.maxScrollExtent) {
        if (_hasReachedMax == false) {
          context.read<PublishedWatcherBloc>().add(
                const PublishedWatcherEvent.fetch(isRefresh: false),
              );
        }
      }
    });

    //* Banned Article ListView
    _bannedScrollCtrl.addListener(() {
      if (_bannedScrollCtrl.position.pixels >=
          _bannedScrollCtrl.position.maxScrollExtent) {
        if (_hasReachedMax == false) {
          context
              .read<BannedWatcherBloc>()
              .add(const BannedWatcherEvent.fetch(isRefresh: false));
        }
      }
    });
    Future.microtask(
      () => context
          .read<DraftedWatcherBloc>()
          .add(const DraftedWatcherEvent.fetch(isRefresh: false)),
    );
  }

  @override
  void dispose() {
    _drafScrollCtrl.dispose();
    _moderatedScrollCtrl.dispose();
    _rejectedScrollCtrl.dispose();
    _publishedScrollCtrl.dispose();
    _bannedScrollCtrl.dispose();

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
                context
                    .read<DraftedWatcherBloc>()
                    .add(const DraftedWatcherEvent.fetch(isRefresh: true));
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
                context
                    .read<DraftedWatcherBloc>()
                    .add(const DraftedWatcherEvent.fetch(isRefresh: true));
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
              BlocBuilder<DraftedWatcherBloc, DraftedWatcherState>(
                builder: (context, state) {
                  return state.maybeMap(
                    orElse: () {
                      // TODO(dickyrey): Implement Error UI
                      return const SizedBox();
                    },
                    loading: (_) {
                      return const _LoadingWidget();
                    },
                    loaded: (state) {
                      _hasReachedMax = state.hasReachedMax;
                      return _ListArticleWidget(
                        controller: _drafScrollCtrl,
                        hasReachedMax: state.hasReachedMax,
                        articleList: state.articleList,
                        onRefresh: () async {
                          context.read<DraftedWatcherBloc>().add(
                                const DraftedWatcherEvent.fetch(
                                  isRefresh: true,
                                ),
                              );
                        },
                      );
                    },
                  );
                },
              ),
              BlocBuilder<ModeratedWatcherBloc, ModeratedWatcherState>(
                builder: (context, state) {
                  return state.maybeMap(
                    orElse: () {
                      // TODO(dickyrey): Implement Error UI
                      return const SizedBox();
                    },
                    loading: (_) {
                      return const _LoadingWidget();
                    },
                    loaded: (state) {
                      _hasReachedMax = state.hasReachedMax;
                      return _ListArticleWidget(
                        controller: _moderatedScrollCtrl,
                        hasReachedMax: state.hasReachedMax,
                        articleList: state.articleList,
                        onRefresh: () async {
                          context.read<ModeratedWatcherBloc>().add(
                                const ModeratedWatcherEvent.fetch(
                                  isRefresh: true,
                                ),
                              );
                        },
                      );
                    },
                  );
                },
              ),
              BlocBuilder<RejectedWatcherBloc, RejectedWatcherState>(
                builder: (context, state) {
                  return state.maybeMap(
                    orElse: () {
                      // TODO(dickyrey): Implement Error UI
                      return const SizedBox();
                    },
                    loading: (_) {
                      return const _LoadingWidget();
                    },
                    loaded: (state) {
                      _hasReachedMax = state.hasReachedMax;
                      return _ListArticleWidget(
                        controller: _rejectedScrollCtrl,
                        hasReachedMax: state.hasReachedMax,
                        articleList: state.articleList,
                        onRefresh: () async {
                          context.read<RejectedWatcherBloc>().add(
                                const RejectedWatcherEvent.fetch(
                                  isRefresh: true,
                                ),
                              );
                        },
                      );
                    },
                  );
                },
              ),
              BlocBuilder<PublishedWatcherBloc, PublishedWatcherState>(
                builder: (context, state) {
                  return state.maybeMap(
                    orElse: () {
                      // TODO(dickyrey): Implement Error UI
                      return const SizedBox();
                    },
                    loading: (_) {
                      return const _LoadingWidget();
                    },
                    loaded: (state) {
                      _hasReachedMax = state.hasReachedMax;
                      return _ListArticleWidget(
                        controller: _publishedScrollCtrl,
                        hasReachedMax: state.hasReachedMax,
                        articleList: state.articleList,
                        onRefresh: () async {
                          context.read<PublishedWatcherBloc>().add(
                                const PublishedWatcherEvent.fetch(
                                  isRefresh: true,
                                ),
                              );
                        },
                      );
                    },
                  );
                },
              ),
              BlocBuilder<BannedWatcherBloc, BannedWatcherState>(
                builder: (context, state) {
                  return state.maybeMap(
                    orElse: () {
                      // TODO(dickyrey): Implement Error UI
                      return const SizedBox();
                    },
                    loading: (_) {
                      return const _LoadingWidget();
                    },
                    loaded: (state) {
                      _hasReachedMax = state.hasReachedMax;
                      return _ListArticleWidget(
                        controller: _bannedScrollCtrl,
                        hasReachedMax: state.hasReachedMax,
                        articleList: state.articleList,
                        onRefresh: () async {
                          context.read<BannedWatcherBloc>().add(
                                const BannedWatcherEvent.fetch(isRefresh: true),
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
            final state = context.read<DraftedWatcherBloc>().state;
            if (state.runtimeType != DraftedWatcherState.loaded.runtimeType) {
              context
                  .read<DraftedWatcherBloc>()
                  .add(const DraftedWatcherEvent.fetch(isRefresh: true));
            }
          } else if (index == 1) {
            final state = context.read<ModeratedWatcherBloc>().state;
            if (state.runtimeType != DraftedWatcherState.loaded.runtimeType) {
              context
                  .read<ModeratedWatcherBloc>()
                  .add(const ModeratedWatcherEvent.fetch(isRefresh: true));
            }
          } else if (index == 2) {
            final state = context.read<RejectedWatcherBloc>().state;
            if (state.runtimeType != BannedWatcherState.loaded.runtimeType) {
              context
                  .read<RejectedWatcherBloc>()
                  .add(const RejectedWatcherEvent.fetch(isRefresh: true));
            }
          } else if (index == 3) {
            final state = context.read<PublishedWatcherBloc>().state;
            if (state.runtimeType != BannedWatcherState.loaded.runtimeType) {
              context
                  .read<PublishedWatcherBloc>()
                  .add(const PublishedWatcherEvent.fetch(isRefresh: true));
            }
          } else if (index == 4) {
            final state = context.read<BannedWatcherBloc>().state;
            if (state.runtimeType != BannedWatcherState.loaded.runtimeType) {
              context
                  .read<BannedWatcherBloc>()
                  .add(const BannedWatcherEvent.fetch(isRefresh: true));
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

class _ListArticleWidget extends StatelessWidget {
  const _ListArticleWidget({
    required this.controller,
    required this.hasReachedMax,
    required this.articleList,
    required this.onRefresh,
  });

  final ScrollController controller;
  final bool hasReachedMax;
  final List<Article> articleList;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;

    if (articleList.isNotEmpty) {
      return RefreshIndicator(
        onRefresh: onRefresh,
        child: ListView.separated(
          controller: controller,
          itemCount:
              hasReachedMax ? articleList.length : articleList.length + 1,
          padding: const EdgeInsets.symmetric(
            vertical: Const.margin,
          ),
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return const SizedBox(height: Const.space15);
          },
          itemBuilder: (context, index) {
            if (index == articleList.length && hasReachedMax != true) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: CircularProgressIndicator(),
                ),
              );
            }
            final article = articleList[index];
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
    } else {
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
    }
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget();

  @override
  Widget build(BuildContext context) {
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
  }
}
