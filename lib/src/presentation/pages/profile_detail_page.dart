import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:interpretasi/src/common/colors.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/common/routes.dart';
import 'package:interpretasi/src/common/screens.dart';
import 'package:interpretasi/src/domain/entities/user.dart';
import 'package:interpretasi/src/presentation/bloc/user/user_form/user_form_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/user_article/read_history_watcher/read_history_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/user_article/user_article_published_watcher/user_article_published_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/widgets/article_card_widget.dart';
import 'package:interpretasi/src/presentation/widgets/empty_data_widget.dart';
import 'package:interpretasi/src/presentation/widgets/outlined_button_widget.dart';

class ProfileDetailPage extends StatefulWidget {
  const ProfileDetailPage({super.key, required this.user});

  final User user;

  @override
  State<ProfileDetailPage> createState() => _ProfileDetailPageState();
}

class _ProfileDetailPageState extends State<ProfileDetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context
          .read<ReadHistoryWatcherBloc>()
          .add(const ReadHistoryWatcherEvent.fetch());
      context
          .read<UserArticlePublishedWatcherBloc>()
          .add(const UserArticlePublishedWatcherEvent.fetch());
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: _appBar(context),
        body: const TabBarView(
          children: [_ReadHistoryWidget(), _MyArticlesWidget()],
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
        lang.my_profile,
        style: theme.textTheme.headlineSmall,
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, SETTINGS_AND_PRIVACY);
          },
          icon: const Icon(FeatherIcons.settings),
          color: ColorLight.fontTitle,
        ),
      ],
      bottom: PreferredSize(
        preferredSize: Size(
          Screens.width(context),
          150,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Const.margin,
            vertical: Const.space15,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: theme.disabledColor,
                    backgroundImage: CachedNetworkImageProvider(
                      widget.user.photo,
                    ),
                  ),
                  const SizedBox(width: Const.space8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.user.name,
                          maxLines: 1,
                          style: theme.textTheme.headlineSmall,
                        ),
                        Text(
                          widget.user.email,
                          maxLines: 1,
                          style: theme.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: Const.space8),
                  // const Spacer(),
                  OutlinedButtonWidget(
                    width: 80,
                    height: 30,
                    icon: const Icon(
                      FeatherIcons.edit3,
                      size: 15,
                    ),
                    onTap: () {
                      context
                          .read<UserFormBloc>()
                          .add(UserFormEvent.initialize(widget.user));

                      Navigator.pushNamed(context, PROFILE_FORM);
                    },
                    label: lang.edit,
                  ),
                ],
              ),
              const SizedBox(height: Const.space8),
              TabBar(
                labelColor: theme.primaryColor,
                unselectedLabelColor: theme.hintColor,
                labelStyle: theme.textTheme.labelSmall,
                unselectedLabelStyle: theme.textTheme.bodyLarge,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Tab(text: lang.read_history),
                  Tab(text: lang.my_articles),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ReadHistoryWidget extends StatelessWidget {
  const _ReadHistoryWidget();

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;

    return BlocBuilder<ReadHistoryWatcherBloc, ReadHistoryWatcherState>(
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
            if (state.articleList.isNotEmpty) {
              return ListView.builder(
                itemCount: state.articleList.take(5).length,
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
    );
  }
}

class _MyArticlesWidget extends StatelessWidget {
  const _MyArticlesWidget();

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;

    return BlocBuilder<UserArticlePublishedWatcherBloc,
        UserArticlePublishedWatcherState>(
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
            if (state.articleList.isNotEmpty) {
              return ListView.builder(
                itemCount: state.articleList.length,
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final article = state.articleList[index];

                  return ArticleCardWidget(
                    article: article,
                    index: index,
                    showEditButton: true,
                    showDeleteButton: true,
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
    );
  }
}
