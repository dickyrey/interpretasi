import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/common/routes.dart';
import 'package:interpretasi/src/presentation/bloc/article/search_article_watcher/search_article_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/widgets/article_card_widget.dart';
import 'package:interpretasi/src/presentation/widgets/empty_data_widget.dart';
import 'package:interpretasi/src/presentation/widgets/text_field_widget.dart';

class ArticleSearchPage extends StatelessWidget {
  const ArticleSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: Const.space12),
            Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(FeatherIcons.arrowLeft),
                ),
                const SizedBox(width: Const.space12),
                Expanded(
                  child: TextFieldWidget(
                    showBorder: true,
                    hintText: lang.search_here,
                    textInputAction: TextInputAction.search,
                    onChanged: (v) {
                      context
                          .read<SearchArticleWatcherBloc>()
                          .add(SearchArticleWatcherEvent.search(v));
                    },
                  ),
                ),
                const SizedBox(width: Const.margin),
              ],
            ),
            const SizedBox(height: Const.margin),
            Expanded(
              child: BlocBuilder<SearchArticleWatcherBloc,
                  SearchArticleWatcherState>(
                builder: (context, state) {
                  return state.maybeMap(
                    orElse: () {
                      return EmptyDataWidget(
                        illustration: Assets.search,
                        title: lang.search_for_articles,
                        subtitle: lang
                            .find_relevant_and_informative_content_on_your_topic_of_interest,
                      );
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
                      if (state.articleList.isEmpty) {
                        return EmptyDataWidget(
                          illustration: Assets.search,
                          title: lang.no_results_found,
                          subtitle: lang
                              .sorry_we_couldnt_find_any_articles_or_blog_posts_that_match_your_search_criteria_please_try_again_with_different_keywords,
                        );
                      }
                      return ListView.builder(
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
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
