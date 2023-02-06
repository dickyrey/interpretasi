import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:interpretasi/src/common/colors.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/presentation/bloc/article/latest_article_watcher/latest_article_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/widgets/article_card_widget.dart';

class LatestPage extends StatelessWidget {
  const LatestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            // TODO(dickyrey): https://github.com/dickyrey/interpretasi/issues/10
          },
          icon: const Icon(FeatherIcons.search),
          color: ColorLight.fontTitle,
        ),
        const SizedBox(width: Const.margin),
      ],
    );
  }
}
