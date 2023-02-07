import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:interpretasi/src/common/colors.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/common/screens.dart';
import 'package:interpretasi/src/domain/entities/article.dart';
import 'package:interpretasi/src/presentation/bloc/article/article_detail_watcher/article_detail_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/comment_article/article_comment_watcher/article_comment_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/comment_article/delete_comment_actor/delete_comment_actor_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/comment_article/send_comment_actor/send_comment_actor_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/like_article_watcher/like_article_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/widgets/comment_card.dart';
import 'package:interpretasi/src/presentation/widgets/text_form_field_widget.dart';
import 'package:interpretasi/src/utilities/toast.dart';
import 'package:intl/intl.dart';

class ArticleDetailPage extends StatefulWidget {
  const ArticleDetailPage({super.key, required this.article});

  final Article article;

  @override
  State<ArticleDetailPage> createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<ArticleDetailWatcherBloc>().add(
            ArticleDetailWatcherEvent.fetchArticleDetail(widget.article.url),
          );
      context
          .read<LikeArticleWatcherBloc>()
          .add(LikeArticleWatcherEvent.fetchStatus(widget.article.url));
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: _appBar(context, article: widget.article),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: Const.space25),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Const.margin,
                    ),
                    child: Text(
                      'E-Sports',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: Colors.red,
                      ),
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
                  const SizedBox(height: Const.space15),
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: Const.margin,
                    ),
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundColor: theme.disabledColor,
                      backgroundImage: const CachedNetworkImageProvider(
                        'https://i.pinimg.com/564x/98/57/47/985747db6a1c15cc64fc1723e4da4d63.jpg',
                      ),
                    ),
                    title: Text(
                      'Byneet Dev',
                      style: theme.textTheme.labelSmall,
                    ),
                    subtitle: Text(
                      'Author, ${DateFormat('d MMM yy').format(widget.article.createdAt)}',
                      style: theme.textTheme.titleSmall,
                    ),
                  ),
                  const SizedBox(height: Const.space15),
                  CachedNetworkImage(imageUrl: widget.article.image),
                  const SizedBox(height: Const.space15),
                  BlocBuilder<ArticleDetailWatcherBloc,
                      ArticleDetailWatcherState>(
                    builder: (context, state) {
                      return state.maybeMap(
                        orElse: () {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                        loaded: (state) {
                          return Html(
                            data: state.articleDetail.content,
                          );
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          ),
          Card(
            elevation: 7,
            margin: EdgeInsets.zero,
            child: Container(
              width: Screens.width(context),
              height: 70,
              color: theme.colorScheme.background,
              padding: const EdgeInsets.symmetric(horizontal: Const.margin),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        context.read<ArticleCommentWatcherBloc>().add(
                              ArticleCommentWatcherEvent.fetchComments(
                                widget.article.url,
                              ),
                            );
                        _showCommentDialog(context);
                      },
                      child: TextFormFieldWidget(
                        enabled: false,
                        hintText: lang.write_comment,
                      ),
                    ),
                  ),
                  const SizedBox(width: Const.space12),
                  BlocBuilder<LikeArticleWatcherBloc, LikeArticleWatcherState>(
                    builder: (context, state) {
                      return state.maybeMap(
                        orElse: () {
                          return GestureDetector(
                            onTap: () {
                              context.read<LikeArticleWatcherBloc>().add(
                                    LikeArticleWatcherEvent.likePressed(
                                      widget.article.url,
                                    ),
                                  );
                            },
                            child: const Icon(
                              FeatherIcons.heart,
                              color: ColorLight.fontTitle,
                            ),
                          );
                        },
                        liked: (_) {
                          return GestureDetector(
                            onTap: () {
                              context.read<LikeArticleWatcherBloc>().add(
                                    LikeArticleWatcherEvent.likePressed(
                                      widget.article.url,
                                    ),
                                  );
                            },
                            child: const Icon(
                              Icons.favorite,
                              color: ColorDark.error,
                            ),
                          );
                        },
                      );
                    },
                  ),
                  const SizedBox(width: Const.space15),
                  GestureDetector(
                    onTap: () {
                      context.read<ArticleCommentWatcherBloc>().add(
                            ArticleCommentWatcherEvent.fetchComments(
                              widget.article.url,
                            ),
                          );
                      _showCommentDialog(context);
                    },
                    child: const Icon(FeatherIcons.messageCircle),
                  ),
                  const SizedBox(width: Const.space15),
                  GestureDetector(
                    onTap: () async {
                      await FlutterShare.share(
                        title: 'Share message',
                        linkUrl: widget.article.url,
                        chooserTitle: 'Example Chooser Title',
                      );
                    },
                    child: const Icon(FeatherIcons.share2),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<dynamic> _showCommentDialog(BuildContext context) {
    return showModalBottomSheet<dynamic>(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Const.radius),
      ),
      builder: (BuildContext context) {
        return CommentDialog(article: widget.article);
      },
    );
  }

  AppBar _appBar(BuildContext context, {required Article article}) {
    final theme = Theme.of(context);

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
    );
  }
}

class CommentDialog extends StatefulWidget {
  const CommentDialog({super.key, required this.article});

  final Article article;

  @override
  State<CommentDialog> createState() => _CommentDialogState();
}

class _CommentDialogState extends State<CommentDialog> {
  late TextEditingController _commentController;
  late ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _commentController = TextEditingController();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return MultiBlocListener(
      listeners: [
        BlocListener<SendCommentActorBloc, SendCommentActorState>(
          listener: (context, state) {
            state.maybeMap(
              orElse: () {},
              sendFailure: (_) {
                showToast(
                  msg: lang.failed_to_post_comment_try_again_later,
                );
              },
              sendSuccess: (_) {
                _commentController.clear();
                _scrollController.animateTo(
                  _scrollController.position.maxScrollExtent,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                );
                context
                    .read<SendCommentActorBloc>()
                    .add(const SendCommentActorEvent.init());
                context.read<ArticleCommentWatcherBloc>().add(
                      ArticleCommentWatcherEvent.refreshComments(
                        widget.article.url,
                      ),
                    );
              },
            );
          },
        ),
        BlocListener<DeleteCommentActorBloc, DeleteCommentActorState>(
          listener: (context, state) {
            state.maybeMap(
              orElse: () {},
              deleteInFailure: (_) {
                context
                    .read<DeleteCommentActorBloc>()
                    .add(const DeleteCommentActorEvent.init());
                showToast(
                  msg: lang.failed_to_delete_comment_try_again_later,
                );
              },
              deleteInSuccess: (_) {
                // showToast(
                //   msg: 'lang.comment_deleted',
                //   gravity: ToastGravity.BOTTOM,
                // );
                context
                    .read<DeleteCommentActorBloc>()
                    .add(const DeleteCommentActorEvent.init());
                context.read<ArticleCommentWatcherBloc>().add(
                      ArticleCommentWatcherEvent.refreshComments(
                        widget.article.url,
                      ),
                    );
              },
            );
          },
        ),
      ],
      child: SizedBox(
        height: Screens.heigth(context) - 100,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Const.margin,
                vertical: Const.space12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    lang.comments,
                    style: theme.textTheme.headlineSmall,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(FeatherIcons.x),
                  )
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<ArticleCommentWatcherBloc,
                  ArticleCommentWatcherState>(
                builder: (context, state) {
                  return state.maybeMap(
                    orElse: () {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    loaded: (state) {
                      return ListView.builder(
                        controller: _scrollController,
                        itemCount: state.comments.length,
                        shrinkWrap: true,
                        padding: const EdgeInsets.fromLTRB(
                          Const.margin,
                          0,
                          Const.margin,
                          Const.space50 + Const.space25,
                        ),
                        physics: const ScrollPhysics(),
                        itemBuilder: (context, index) {
                          final comment = state.comments[index];
                          return CommentCardWidget(
                            article: widget.article,
                            comment: comment,
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
            Card(
              elevation: 7,
              margin: EdgeInsets.zero,
              child: Container(
                width: Screens.width(context),
                height: 70,
                color: theme.colorScheme.background,
                padding: const EdgeInsets.only(left: Const.margin),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormFieldWidget(
                        controller: _commentController,
                        hintText: lang.write_comment,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<SendCommentActorBloc>().add(
                              SendCommentActorEvent.sendComment(
                                id: widget.article.url,
                                comment: _commentController.text,
                              ),
                            );
                      },
                      icon: Icon(
                        Icons.send,
                        color: theme.primaryColor,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
