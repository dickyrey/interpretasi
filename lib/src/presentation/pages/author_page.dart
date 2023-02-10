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
import 'package:interpretasi/src/presentation/bloc/author/author_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/pages/report_article_page.dart';
import 'package:interpretasi/src/presentation/widgets/article_card_widget.dart';
import 'package:interpretasi/src/presentation/widgets/dialog_widget.dart';
import 'package:interpretasi/src/presentation/widgets/shimmer_widget.dart';

class AuthorPage extends StatefulWidget {
  const AuthorPage({super.key, required this.id});

  final int id;

  @override
  State<AuthorPage> createState() => _AuthorPageState();
}

class _AuthorPageState extends State<AuthorPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context
          .read<AuthorWatcherBloc>()
          .add(AuthorWatcherEvent.fetch(widget.id)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: _appBar(context),
      // backgroundColor: Color(0xFFF8FAFF),
      body: Column(
        children: [
          const SizedBox(height: Const.space12),
          BlocBuilder<AuthorWatcherBloc, AuthorWatcherState>(
            builder: (context, state) {
              return state.maybeMap(
                orElse: () {
                  return const SizedBox();
                },
                loading: (_) {
                  return ShimmerWidget(
                    child: Container(
                      height: 60,
                      padding: const EdgeInsets.symmetric(
                        horizontal: Const.margin,
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: theme.disabledColor,
                          ),
                          const SizedBox(width: Const.space8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ShimmerContainerWidget(
                                  height: 15,
                                  width: Screens.width(context) / 2,
                                ),
                                const SizedBox(height: Const.space15),
                                ShimmerContainerWidget(
                                  width: Screens.width(context) / 4,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: Const.space8),
                          const Icon(FeatherIcons.moreVertical),
                        ],
                      ),
                    ),
                  );
                },
                loaded: (state) {
                  return Container(
                    height: 60,
                    padding: const EdgeInsets.symmetric(
                      horizontal: Const.margin,
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: theme.disabledColor,
                          backgroundImage: CachedNetworkImageProvider(
                            state.author.photo,
                          ),
                        ),
                        const SizedBox(width: Const.space8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                state.author.name,
                                maxLines: 1,
                                style: theme.textTheme.headlineSmall,
                              ),
                              Text(
                                state.author.email,
                                maxLines: 1,
                                style: theme.textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: Const.space8),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                            showMultiButtonDialog(
                              context,
                              items: [
                                TileButtonDialog(
                                  label: lang.report,
                                  icon: FeatherIcons.info,
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      REPORT_ARTICLE,
                                      arguments: ReportArgument(
                                        type: ReportType.author,
                                        author: state.author,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                          icon: const Icon(FeatherIcons.moreVertical),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
          const SizedBox(height: Const.space25),
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: theme.primaryColor.withOpacity(.03),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(Const.space25),
                  topRight: Radius.circular(Const.space25),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: Const.space12),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Const.margin,
                    ),
                    child: Text(
                      lang.posts,
                      style: theme.textTheme.headlineMedium,
                    ),
                  ),
                  const SizedBox(height: Const.space12),
                  BlocBuilder<LatestArticleWatcherBloc,
                      LatestArticleWatcherState>(
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
                          return Expanded(
                            child: ListView.builder(
                              itemCount: state.articleList.length,
                              physics: const ScrollPhysics(),
                              shrinkWrap: true,
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
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return AppBar(
      backgroundColor: theme.colorScheme.background,
      elevation: .5,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(
          FeatherIcons.arrowLeft,
          color: theme.iconTheme.color,
        ),
      ),
      title: Text(
        lang.author,
        style: theme.textTheme.headlineSmall,
      ),
    );
  }
}
