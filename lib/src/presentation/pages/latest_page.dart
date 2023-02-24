import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/common/routes.dart';
import 'package:interpretasi/src/presentation/bloc/article/latest_article_watcher/latest_article_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/widgets/article_card_widget.dart';

class LatestPage extends StatefulWidget {
  const LatestPage({super.key});

  @override
  State<LatestPage> createState() => _LatestPageState();
}

class _LatestPageState extends State<LatestPage> {
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
              .read<LatestArticleWatcherBloc>()
              .add(const LatestArticleWatcherEvent.fetch(isRefresh: false));
        }
      }
    });

    Future.microtask(
      () => context
          .read<LatestArticleWatcherBloc>()
          .add(const LatestArticleWatcherEvent.fetch(isRefresh: false)),
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
            .read<LatestArticleWatcherBloc>()
            .add(const LatestArticleWatcherEvent.fetch(isRefresh: true));
      },
      child: Scaffold(
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
        const SizedBox(width: Const.margin),
      ],
    );
  }
}
