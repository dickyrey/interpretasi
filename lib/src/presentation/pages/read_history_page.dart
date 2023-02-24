import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/common/routes.dart';
import 'package:interpretasi/src/presentation/bloc/user_article/read_history_watcher/read_history_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/widgets/article_card_widget.dart';
import 'package:interpretasi/src/presentation/widgets/empty_data_widget.dart';

class ReadHistoryPage extends StatefulWidget {
  const ReadHistoryPage({super.key});

  @override
  State<ReadHistoryPage> createState() => _ReadHistoryPageState();
}

class _ReadHistoryPageState extends State<ReadHistoryPage> {
  late ScrollController _scrollCtrl;
  bool _hasReachedMax = false;
  @override
  void initState() {
    super.initState();
    _scrollCtrl = ScrollController();

    ///  Pagination [Listener]
    _scrollCtrl.addListener(() {
      if (_scrollCtrl.position.pixels >= _scrollCtrl.position.maxScrollExtent) {
        if (_hasReachedMax == false) {
          context
              .read<ReadHistoryWatcherBloc>()
              .add(const ReadHistoryWatcherEvent.fetch(isRefresh: false));
        }
      }
    });
    Future.microtask(
      () => context
          .read<ReadHistoryWatcherBloc>()
          .add(const ReadHistoryWatcherEvent.fetch(isRefresh: false)),
    );
    
  }

  @override
  void dispose() {
    _scrollCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;

    return WillPopScope(
      onWillPop: () async {
        context
            .read<ReadHistoryWatcherBloc>()
            .add(const ReadHistoryWatcherEvent.init());
        return true;
      },
      child: RefreshIndicator(
        onRefresh: () async {
          context
              .read<ReadHistoryWatcherBloc>()
              .add(const ReadHistoryWatcherEvent.fetch(isRefresh: true));
        },
        child: Scaffold(
          appBar: _appBar(context),
          body: BlocBuilder<ReadHistoryWatcherBloc, ReadHistoryWatcherState>(
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
                  if (state.articleList.isNotEmpty) {
                    return ListView.builder(
                      controller: _scrollCtrl,
                      itemCount: state.hasReachedMax
                          ? state.articleList.length
                          : state.articleList.length + 1,
                      physics: const ScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                        vertical: Const.margin,
                      ),
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
                  }
                  return EmptyDataWidget(
                    illustration: Assets.read,
                    title: lang.read_history_empty,
                    subtitle: lang
                        .your_reading_history_is_still_empty_lets_explore_by_reading_interesting_articles,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  // AppBar from On Boarding Page contains back button, logo and Skip button
  AppBar _appBar(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return AppBar(
      backgroundColor: theme.colorScheme.background,
      elevation: .5,
      leading: IconButton(
        onPressed: () {
          context
              .read<ReadHistoryWatcherBloc>()
              .add(const ReadHistoryWatcherEvent.init());
          Navigator.pop(context);
        },
        icon: Icon(
          FeatherIcons.arrowLeft,
          color: theme.iconTheme.color,
        ),
      ),
      title: Text(
        lang.read_history,
        style: theme.textTheme.headlineSmall,
      ),
    );
  }
}
