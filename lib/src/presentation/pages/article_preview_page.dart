import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html/dom.dart' as dom;
import 'package:interpretasi/src/common/colors.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/common/routes.dart';
import 'package:interpretasi/src/common/screens.dart';
import 'package:interpretasi/src/domain/entities/article.dart';
import 'package:interpretasi/src/presentation/bloc/article/article_detail_watcher/article_detail_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/article/article_form/article_form_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/article/delete_article_actor/delete_article_actor_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/category/category_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/widgets/shimmer_widget.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

enum _ArticleValues { edit, delete }

class ArticlePreviewPage extends StatefulWidget {
  const ArticlePreviewPage({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  State<ArticlePreviewPage> createState() => _ArticlePreviewPageState();
}

class _ArticlePreviewPageState extends State<ArticlePreviewPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context
          .read<ArticleDetailWatcherBloc>()
          .add(ArticleDetailWatcherEvent.fetch(widget.article.url));
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;
    final categoryBloc = context.read<CategoryWatcherBloc>().state.categoryList;

    return Scaffold(
      appBar: _appBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: Const.space25),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Const.margin,
              ),
              child: BlocBuilder<ArticleDetailWatcherBloc,
                  ArticleDetailWatcherState>(
                builder: (context, state) {
                  return state.maybeMap(
                    orElse: () {
                      return const ShimmerWidget(
                        child: ShimmerContainerWidget(height: 15),
                      );
                    },
                    loaded: (state) {
                      return Text(
                        categoryBloc.firstWhere((v) {
                          return v.id == state.articleDetail.categoryId;
                        }).name,
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: Colors.red,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: Const.space8),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Const.margin,
              ),
              child: Text(
                widget.article.title,
                style: theme.textTheme.headlineMedium?.copyWith(
                  height: 1.2,
                ),
              ),
            ),
            BlocBuilder<ArticleDetailWatcherBloc, ArticleDetailWatcherState>(
              builder: (context, state) {
                return state.maybeMap(
                  orElse: () {
                    return ShimmerWidget(
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: Const.margin,
                        ),
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundColor: theme.disabledColor,
                        ),
                        title: const ShimmerContainerWidget(height: 15),
                        subtitle: const ShimmerContainerWidget(),
                      ),
                    );
                  },
                  loaded: (state) {
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: Const.margin,
                      ),
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundColor: theme.disabledColor,
                        backgroundImage: CachedNetworkImageProvider(
                          state.articleDetail.author.photo,
                        ),
                      ),
                      title: Text(
                        state.articleDetail.author.name,
                        style: theme.textTheme.labelSmall,
                      ),
                      subtitle: Text(
                        '${lang.author}, ${DateFormat('d MMM yy').format(widget.article.createdAt)}',
                        style: theme.textTheme.titleSmall,
                      ),
                    );
                  },
                );
              },
            ),
            CachedNetworkImage(
              imageUrl: widget.article.image,
              errorWidget: (context, url, error) {
                return const Icon(Icons.error);
              },
              placeholder: (context, url) {
                return const ShimmerWidget(
                  child: ShimmerContainerWidget(
                    width: 250,
                    height: 150,
                  ),
                );
              },
              imageBuilder: (context, imageProvider) {
                return Container(
                  width: Screens.width(context),
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: Const.space15),
            BlocBuilder<ArticleDetailWatcherBloc, ArticleDetailWatcherState>(
              builder: (context, state) {
                return state.maybeMap(
                  orElse: () {
                    return ShimmerWidget(
                      child: Padding(
                        padding: const EdgeInsets.all(Const.margin),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ShimmerContainerWidget(
                              width: Screens.width(context) / 2,
                              height: 15,
                            ),
                            const SizedBox(height: Const.space8),
                            ShimmerContainerWidget(
                              width: Screens.width(context) / 1.7,
                              height: 15,
                            ),
                            const SizedBox(height: Const.space8),
                            const ShimmerContainerWidget(
                              height: 15,
                            ),
                            const SizedBox(height: Const.space8),
                            ShimmerContainerWidget(
                              width: Screens.width(context) / 1.4,
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  loaded: (state) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Const.margin,
                      ),
                      child: Html(
                        data: state.articleDetail.content,
                        onLinkTap: (
                          String? url,
                          RenderContext context,
                          Map<String, String> attributes,
                          dom.Element? element,
                        ) {
                          launchUrl(
                            Uri.parse(url ?? 'https://interpretasi.id'),
                            mode: LaunchMode.externalApplication,
                          );
                        },
                        style: {
                          'h1': Style(
                            fontSize: const FontSize(20),
                            color: ColorLight.fontTitle,
                            fontFamily: GoogleFonts.roboto().fontFamily,
                            letterSpacing: 1.5,
                          ),
                          'h2': Style(
                            fontSize: const FontSize(18),
                            color: ColorLight.fontTitle,
                            fontFamily: GoogleFonts.roboto().fontFamily,
                            letterSpacing: 1.5,
                          ),
                          'h3': Style(
                            fontSize: const FontSize(16),
                            color: ColorLight.fontTitle,
                            fontFamily: GoogleFonts.roboto().fontFamily,
                            letterSpacing: 1.5,
                          ),
                          'p': Style(
                            fontSize: FontSize.medium,
                            color: ColorLight.fontTitle,
                            lineHeight: LineHeight.number(1.2),
                            fontFamily: GoogleFonts.merriweather().fontFamily,
                          ),
                          'li': Style(
                            fontSize: FontSize.medium,
                            color: ColorLight.fontTitle,
                          ),
                          'strong': Style(
                            fontSize: FontSize.medium,
                            color: ColorLight.fontTitle,
                            fontWeight: FontWeight.w700,
                          ),
                          'blockquote': Style(
                            fontSize: FontSize.large,
                            color: ColorLight.fontSubtitle,
                            fontFamily: GoogleFonts.catamaran().fontFamily,
                            before: '"',
                          ),
                        },
                      ),
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Visibility(
        visible: false,
        child: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: theme.primaryColor,
          label: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Const.space12,
            ),
            child: Text(
              lang.publish_now,
              style: theme.textTheme.labelMedium?.copyWith(
                color: Colors.white,
              ),
            ),
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
      elevation: .5,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(
          FeatherIcons.arrowLeft,
          color: theme.iconTheme.color,
        ),
      ),
      title: Text(
        lang.preview,
        style: theme.textTheme.headlineSmall,
      ),
      actions: [
        PopupMenuButton<_ArticleValues>(
          icon: const Icon(
            FeatherIcons.moreVertical,
            size: 20,
            color: ColorLight.fontTitle,
          ),
          onSelected: (value) async {
            switch (value) {
              case _ArticleValues.edit:
                final category = context.read<CategoryWatcherBloc>().state;
                context.read<ArticleFormBloc>().add(
                      ArticleFormEvent.initialize(
                        article: widget.article,
                        categoryList: category.categoryList,
                      ),
                    );
                await Navigator.pushNamed(
                  context,
                  ARTICLE_FORM,
                  arguments: true,
                );
                break;
              case _ArticleValues.delete:
                context
                    .read<DeleteArticleActorBloc>()
                    .add(DeleteArticleActorEvent.delete(widget.article.url));
                break;
            }
          },
          itemBuilder: (context) => [
            PopupMenuItem(
              value: _ArticleValues.edit,
              child: Text(
                lang.edit,
                style: theme.textTheme.titleMedium,
              ),
            ),
            PopupMenuItem(
              value: _ArticleValues.delete,
              child: Text(
                lang.delete,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.error,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
