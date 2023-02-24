import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:interpretasi/src/common/routes.dart';
import 'package:interpretasi/src/presentation/bloc/article/trending_article_watcher/trending_article_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/widgets/article_card_widget.dart';

class ArticleTrendingPage extends StatefulWidget {
  const ArticleTrendingPage({super.key});

  @override
  State<ArticleTrendingPage> createState() => ArticleTrendingPageState();
}

class ArticleTrendingPageState extends State<ArticleTrendingPage> {
  late ScrollController _scrollCtrl;

  bool _hasReachedMax = false;

  @override
  void initState() {
    super.initState();

    /// [ScrollController] init
    _scrollCtrl = ScrollController();

    ///  Pagination [Listener]
    _scrollCtrl.addListener(() {
      if (_scrollCtrl.position.pixels >= _scrollCtrl.position.maxScrollExtent) {
        if (_hasReachedMax == false) {
          context
              .read<TrendingArticleWatcherBloc>()
              .add(const TrendingArticleWatcherEvent.fetch(isRefresh: false));
        }
      }
    });
    Future.microtask(
      () => context
          .read<TrendingArticleWatcherBloc>()
          .add(const TrendingArticleWatcherEvent.fetch(isRefresh: false)),
    );
  }

  @override
  void dispose() {
    _scrollCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context
            .read<TrendingArticleWatcherBloc>()
            .add(const TrendingArticleWatcherEvent.fetch(isRefresh: true));
      },
      child: Scaffold(
        appBar: _appBar(context),
        body: BlocBuilder<TrendingArticleWatcherBloc,
            TrendingArticleWatcherState>(
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
                _hasReachedMax = state.hasReachedMax;
                return ListView.builder(
                  controller: _scrollCtrl,
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
        lang.trending,
        style: theme.textTheme.headlineSmall,
      ),
    );
  }
}
