import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:interpretasi/src/common/colors.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/domain/entities/article.dart';
import 'package:interpretasi/src/domain/entities/comment.dart';
import 'package:interpretasi/src/presentation/bloc/comment_article/delete_comment_actor/delete_comment_actor_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/user/user_watcher/user_watcher_bloc.dart';
import 'package:timeago/timeago.dart' as timeago;

class CommentCardWidget extends StatelessWidget {
  const CommentCardWidget({
    super.key,
    required this.article,
    required this.comment,
  });

  final Article article;
  final Comment comment;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.only(bottom: Const.space15),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: theme.disabledColor,
            backgroundImage: CachedNetworkImageProvider(
              comment.user.photo.isEmpty ? Const.photo : comment.user.photo,
            ),
          ),
          const SizedBox(width: Const.space12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  comment.user.name,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: Const.space8 - 5),
                Text(
                  comment.body,
                  style: theme.textTheme.titleMedium,
                ),
                const SizedBox(height: Const.space8),
                Text(
                  timeago.format(comment.createdAt),
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ),
          BlocBuilder<UserWatcherBloc, UserWatcherState>(
            builder: (context, state) {
              return state.maybeMap(
                orElse: () {
                  return const SizedBox();
                },
                loaded: (state) {
                  return IconButton(
                    icon: const Icon(FeatherIcons.moreVertical),
                    splashRadius: 25,
                    iconSize: 15,
                    onPressed: () {
                      showDialog<dynamic>(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              lang.choose_an_action,
                              style: theme.textTheme.headlineSmall,
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (state.user.id == comment.user.id)
                                  _listTileWidget(
                                    context,
                                    icon: FeatherIcons.trash,
                                    label: lang.delete,
                                    onTap: () {
                                      Navigator.pop(context);
                                      context
                                          .read<DeleteCommentActorBloc>()
                                          .add(
                                            DeleteCommentActorEvent.delete(
                                              id: article.url,
                                              userId: comment.id,
                                            ),
                                          );
                                    },
                                  )
                                else
                                  const SizedBox(),
                                _listTileWidget(
                                  context,
                                  icon: FeatherIcons.alertCircle,
                                  label: lang.report,
                                  onTap: () {
                                    // TODO(dickyrey): https://github.com/dickyrey/interpretasi/issues/13
                                  },
                                )
                              ],
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }

  SizedBox _listTileWidget(
    BuildContext context, {
    VoidCallback? onTap,
    required IconData icon,
    required String label,
  }) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 40,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(Const.radius),
        child: Row(
          children: [
            Icon(
              icon,
              size: 18,
              color: ColorLight.fontTitle,
            ),
            const SizedBox(width: Const.space12),
            Text(
              label,
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
