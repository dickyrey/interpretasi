import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/common/enums.dart';
import 'package:interpretasi/src/common/screens.dart';
import 'package:interpretasi/src/domain/entities/article.dart';
import 'package:interpretasi/src/presentation/bloc/article/delete_article_actor/delete_article_actor_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/user_article/moderated_actor/moderated_actor_bloc.dart';
import 'package:interpretasi/src/presentation/widgets/dialog_widget.dart';
import 'package:interpretasi/src/presentation/widgets/shimmer_widget.dart';
import 'package:timeago/timeago.dart' as timeago;

class ArticleCardWidget extends StatelessWidget {
  const ArticleCardWidget({
    super.key,
    required this.article,
    required this.index,
    required this.onTap,
    this.align = CardAlignment.vertical,
    this.showPreviewButton = false,
    this.showPublishButton = false,
    this.showEditButton = false,
    this.showDeleteButton = false,
    this.showReportButton = false,
    this.showShareButton = false,
  });

  final Article article;
  final int index;
  final VoidCallback onTap;
  final CardAlignment align;
  final bool showPreviewButton;
  final bool showPublishButton;
  final bool showEditButton;
  final bool showDeleteButton;
  final bool showReportButton;
  final bool showShareButton;

  @override
  Widget build(BuildContext context) {
    Widget content;
    switch (align) {
      case CardAlignment.horizontal:
        content = _HorizontalCard(
          article: article,
          index: index,
          onTap: onTap,
        );
        break;
      case CardAlignment.vertical:
        content = _VerticalCard(
          article: article,
          onTap: onTap,
          showPreviewButton: showPreviewButton,
          showPublishButton: showPublishButton,
          showEditButton: showEditButton,
          showDeleteButton: showDeleteButton,
          showReportButton: showReportButton,
          showShareButton: showShareButton,
        );
        break;
    }

    return content;
  }
}

class ArticleCardLoadingWidget extends StatelessWidget {
  const ArticleCardLoadingWidget({
    super.key,
    this.align = CardAlignment.vertical,
  });

  final CardAlignment align;

  @override
  Widget build(BuildContext context) {
    Widget content;
    switch (align) {
      case CardAlignment.horizontal:
        content = const _HorizontalCardLoading();
        break;
      case CardAlignment.vertical:
        content = const _VerticalCardLoading();
        break;
    }

    return content;
  }
}

class _HorizontalCard extends StatelessWidget {
  const _HorizontalCard({
    required this.article,
    required this.index,
    required this.onTap,
  });

  final Article article;
  final int index;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    String formatViewsCount(int viewsCount) {
      if (viewsCount >= 1000000000) {
        return '${(viewsCount / 1000000000).toStringAsFixed(1)}b';
      } else if (viewsCount >= 1000000) {
        return '${(viewsCount / 1000000).toStringAsFixed(1)}m';
      } else if (viewsCount >= 1000) {
        return '${(viewsCount / 1000).toStringAsFixed(1)}k';
      }
      return '$viewsCount';
    }

    return Container(
      width: 250,
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(Const.radius),
      ),
      margin: const EdgeInsets.only(right: Const.space15),
      padding: const EdgeInsets.all(Const.space8 / 2),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              width: 250,
              height: 150,
              imageUrl: article.image,
              errorWidget: (context, url, error) => const Icon(Icons.error),
              placeholder: (context, url) => const ShimmerWidget(
                child: ShimmerContainerWidget(
                  width: 250,
                  height: 150,
                ),
              ),
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Const.radius),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Const.space12 / 2,
                vertical: Const.space8,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        Assets.fire,
                        width: 10,
                      ),
                      const SizedBox(width: Const.space8),
                      Text(
                        '${lang.trending_no}${index + 1}',
                        style: theme.textTheme.bodySmall,
                      ),
                      const Spacer(),
                      Text(
                        timeago.format(article.createdAt),
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: Const.space12),
                  Text(
                    article.title,
                    style: theme.textTheme.titleLarge,
                    maxLines: 3,
                  ),
                  const SizedBox(height: Const.space12),
                  Row(
                    children: [
                      Icon(
                        FeatherIcons.eye,
                        color: theme.hintColor,
                        size: 12,
                      ),
                      const SizedBox(width: Const.space8),
                      Text(
                        formatViewsCount(article.viewers),
                        style: theme.textTheme.bodyMedium,
                        maxLines: 3,
                      ),
                      const SizedBox(width: Const.space12),
                      Icon(
                        FeatherIcons.heart,
                        color: theme.hintColor,
                        size: 12,
                      ),
                      const SizedBox(width: Const.space8),
                      Text(
                        formatViewsCount(article.likes),
                        style: theme.textTheme.bodyMedium,
                        maxLines: 3,
                      ),
                      const SizedBox(width: Const.space12),
                      Icon(
                        FeatherIcons.messageCircle,
                        color: theme.hintColor,
                        size: 12,
                      ),
                      const SizedBox(width: Const.space8),
                      Text(
                        formatViewsCount(article.comments),
                        style: theme.textTheme.bodyMedium,
                        maxLines: 3,
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {},
                        child: const Icon(
                          FeatherIcons.moreHorizontal,
                          size: 20,
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _VerticalCard extends StatelessWidget {
  const _VerticalCard({
    required this.article,
    required this.onTap,
    this.showPreviewButton = false,
    this.showPublishButton = false,
    this.showEditButton = false,
    this.showDeleteButton = false,
    this.showReportButton = false,
    this.showShareButton = false,
  });

  final Article article;
  final VoidCallback onTap;
  final bool showPreviewButton;
  final bool showPublishButton;
  final bool showEditButton;
  final bool showDeleteButton;
  final bool showReportButton;
  final bool showShareButton;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    String formatViewsCount(int viewsCount) {
      if (viewsCount >= 1000000000) {
        return '${(viewsCount / 1000000000).toStringAsFixed(1)}b';
      } else if (viewsCount >= 1000000) {
        return '${(viewsCount / 1000000).toStringAsFixed(1)}m';
      } else if (viewsCount >= 1000) {
        return '${(viewsCount / 1000).toStringAsFixed(1)}k';
      }
      return '$viewsCount';
    }

    return Container(
      width: Screens.width(context),
      height: 105,
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(Const.radius),
      ),
      margin: const EdgeInsets.fromLTRB(
        Const.margin,
        0,
        Const.margin,
        Const.space12,
      ),
      padding: const EdgeInsets.all(Const.space8 / 2),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Const.space12 / 2,
                  vertical: Const.space8 / 2,
                ),
                child: Column(
                  children: [
                    Text(
                      article.title,
                      style: theme.textTheme.titleLarge?.copyWith(
                        height: 1.5,
                      ),
                      maxLines: 3,
                    ),
                    const SizedBox(height: Const.space8 - 3),
                    const Spacer(),
                    Row(
                      children: [
                        Icon(
                          FeatherIcons.eye,
                          color: theme.hintColor,
                          size: 12,
                        ),
                        const SizedBox(width: Const.space8),
                        Text(
                          formatViewsCount(article.viewers),
                          style: theme.textTheme.bodyMedium,
                          maxLines: 3,
                        ),
                        const SizedBox(width: Const.space12),
                        Icon(
                          FeatherIcons.heart,
                          color: theme.hintColor,
                          size: 12,
                        ),
                        const SizedBox(width: Const.space8),
                        Text(
                          formatViewsCount(article.likes),
                          style: theme.textTheme.bodyMedium,
                          maxLines: 3,
                        ),
                        const SizedBox(width: Const.space12),
                        Icon(
                          FeatherIcons.messageCircle,
                          color: theme.hintColor,
                          size: 12,
                        ),
                        const SizedBox(width: Const.space8),
                        Text(
                          formatViewsCount(article.comments),
                          style: theme.textTheme.bodyMedium,
                          maxLines: 3,
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            showMultiButtonDialog(
                              context,
                              items: [
                                TileButtonDialog(
                                  onTap: () {
                                    //TODO: Share Article
                                  },
                                  isVisible: showShareButton,
                                  icon: FeatherIcons.share,
                                  label: lang.share,
                                ),
                                TileButtonDialog(
                                  onTap: () {
                                    //TODO: Preview
                                  },
                                  icon: FeatherIcons.eye,
                                  label: lang.preview,
                                  isVisible: showPreviewButton,
                                ),
                                TileButtonDialog(
                                  onTap: () {
                                    Navigator.pop(context);
                                    context.read<ModeratedActorBloc>().add(
                                          ModeratedActorEvent.change(
                                            article.url,
                                          ),
                                        );
                                  },
                                  isVisible: showPublishButton,
                                  icon: FeatherIcons.send,
                                  label: lang.publish,
                                ),
                                TileButtonDialog(
                                  onTap: () {
                                    //TODO: Edit
                                  },
                                  isVisible: showEditButton,
                                  icon: FeatherIcons.edit3,
                                  label: lang.edit,
                                ),
                                TileButtonDialog(
                                  onTap: () {
                                    //TODO: Report Article
                                  },
                                  isVisible: showReportButton,
                                  icon: FeatherIcons.info,
                                  label: lang.report,
                                ),
                                TileButtonDialog(
                                  onTap: () {
                                    Navigator.pop(context);
                                    context.read<DeleteArticleActorBloc>().add(
                                          DeleteArticleActorEvent.delete(
                                            article.url,
                                          ),
                                        );
                                  },
                                  isVisible: showDeleteButton,
                                  icon: FeatherIcons.trash,
                                  label: lang.delete,
                                  color: theme.colorScheme.error,
                                  padding: const EdgeInsets.only(
                                    top: Const.space15,
                                  ),
                                ),
                              ],
                            );
                            // if (isPublic == true) {
                            //   showMultiButtonDialog(
                            //     context,
                            //     items: [

                            //     ],
                            //   );
                            // } else {
                            //   showMultiButtonDialog(
                            //     context,
                            //     items: [

                            //     ],
                            //   );
                            // }
                          },
                          child: const Icon(
                            FeatherIcons.moreHorizontal,
                            size: 20,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(width: Const.space8),
            CachedNetworkImage(
              width: 100,
              height: 100,
              imageUrl: article.image,
              errorWidget: (context, url, error) => const Icon(Icons.error),
              placeholder: (context, url) => const ShimmerWidget(
                child: ShimmerContainerWidget(height: 100),
              ),
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Const.radius),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HorizontalCardLoading extends StatelessWidget {
  const _HorizontalCardLoading();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ShimmerWidget(
      child: Container(
        width: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Const.radius),
        ),
        margin: const EdgeInsets.only(right: Const.space15),
        padding: const EdgeInsets.all(Const.space8 / 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ShimmerContainerWidget(
              width: 250,
              height: 150,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Const.space12 / 2,
                vertical: Const.space8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        Assets.fire,
                        width: 10,
                      ),
                      const SizedBox(width: Const.space8),
                      const ShimmerContainerWidget(width: 60),
                      const Spacer(),
                      const ShimmerContainerWidget(width: 30),
                    ],
                  ),
                  const SizedBox(height: Const.space12),
                  const ShimmerContainerWidget(width: 200),
                  const SizedBox(height: Const.space8),
                  const ShimmerContainerWidget(width: 150),
                  const SizedBox(height: Const.space8),
                  const ShimmerContainerWidget(width: 70),
                  const SizedBox(height: Const.space12),
                  Row(
                    children: [
                      Icon(
                        FeatherIcons.eye,
                        color: theme.hintColor,
                        size: 12,
                      ),
                      const SizedBox(width: Const.space8),
                      const ShimmerContainerWidget(width: 30, height: 12),
                      const SizedBox(width: Const.space12),
                      Icon(
                        FeatherIcons.heart,
                        color: theme.hintColor,
                        size: 12,
                      ),
                      const SizedBox(width: Const.space8),
                      const ShimmerContainerWidget(width: 30, height: 12),
                      const SizedBox(width: Const.space12),
                      Icon(
                        FeatherIcons.messageCircle,
                        color: theme.hintColor,
                        size: 12,
                      ),
                      const SizedBox(width: Const.space8),
                      const ShimmerContainerWidget(width: 30, height: 12),
                      const Spacer(),
                      Icon(
                        FeatherIcons.moreHorizontal,
                        size: 20,
                        color: theme.disabledColor,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _VerticalCardLoading extends StatelessWidget {
  const _VerticalCardLoading();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ShimmerWidget(
      child: Container(
        width: Screens.width(context),
        height: 115,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Const.radius),
        ),
        margin: const EdgeInsets.fromLTRB(
          Const.margin,
          0,
          Const.margin,
          Const.space12,
        ),
        padding: const EdgeInsets.all(Const.space8 / 2),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Const.space12 / 2,
                  vertical: Const.space8 / 2,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        ShimmerContainerWidget(width: 50),
                        ShimmerContainerWidget(width: 50),
                      ],
                    ),
                    const SizedBox(height: Const.space8),
                    const ShimmerContainerWidget(width: 150),
                    const SizedBox(height: Const.space8),
                    const ShimmerContainerWidget(),
                    const SizedBox(height: Const.space8),
                    const ShimmerContainerWidget(width: 50),
                    const Spacer(),
                    Row(
                      children: [
                        Icon(
                          FeatherIcons.eye,
                          color: theme.hintColor,
                          size: 12,
                        ),
                        const SizedBox(width: Const.space8),
                        const ShimmerContainerWidget(width: 20),
                        const SizedBox(width: Const.space12),
                        Icon(
                          FeatherIcons.heart,
                          color: theme.hintColor,
                          size: 12,
                        ),
                        const SizedBox(width: Const.space8),
                        const ShimmerContainerWidget(width: 20),
                        const SizedBox(width: Const.space12),
                        Icon(
                          FeatherIcons.messageCircle,
                          color: theme.hintColor,
                          size: 12,
                        ),
                        const SizedBox(width: Const.space8),
                        const ShimmerContainerWidget(width: 20),
                        const Spacer(),
                        const Icon(
                          FeatherIcons.moreHorizontal,
                          size: 20,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(width: Const.space8),
            const ShimmerContainerWidget(height: 100),
          ],
        ),
      ),
    );
  }
}
