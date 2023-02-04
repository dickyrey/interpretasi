import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:interpretasi/src/common/colors.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/presentation/bloc/auth/auth_watcher/auth_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/user/user_watcher/user_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/widgets/dialog_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: Const.space50),
        child: Column(
          children: [
            BlocBuilder<UserWatcherBloc, UserWatcherState>(
              builder: (context, state) {
                return state.maybeMap(
                  orElse: () {
                    return const SizedBox();
                  },
                  loaded: (state) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: CircleAvatar(
                                  radius: 60,
                                  backgroundColor: theme.disabledColor,
                                  backgroundImage: CachedNetworkImageProvider(
                                    state.user.photo,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: CircleAvatar(
                                  backgroundColor: theme.colorScheme.background,
                                  radius: 25,
                                  child: CircleAvatar(
                                    radius: 22,
                                    backgroundColor: theme.primaryColor,
                                    child: const Icon(
                                      FeatherIcons.edit3,
                                      color: Colors.white,
                                      size: 22,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: Const.space15),
                        Text(
                          state.user.name,
                          style: theme.textTheme.headlineMedium,
                        ),
                        const SizedBox(height: Const.space12),
                        Text(
                          state.user.email,
                          style: theme.textTheme.bodyMedium,
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            const SizedBox(height: Const.space25),
            _ListTileWidget(
              icon: FeatherIcons.user,
              title: lang.my_profile,
              onTap: () {
                // Navigator.pushNamed(context, PROFILE);
              },
            ),
            _ListTileWidget(
              title: lang.my_articles,
              icon: FeatherIcons.fileText,
              onTap: () {},
            ),
            _ListTileWidget(
              icon: FeatherIcons.settings,
              title: lang.settings_and_privacy,
              onTap: () {
                // Navigator.pushNamed(context, SETTINGS_AND_PRIVACY);
              },
            ),
            _ListTileWidget(
              icon: FeatherIcons.clock,
              title: lang.read_history,
              onTap: () {
                // Navigator.pushNamed(context, READ_HISTORY);
              },
            ),
            _ListTileWidget(
              icon: FeatherIcons.trendingUp,
              title: lang.trending,
              onTap: () {
                // Navigator.pushNamed(context, TRENDING_ARTICLE);
              },
            ),
            ExpansionTile(
              title: Row(
                children: [
                  const Icon(
                    FeatherIcons.info,
                    color: ColorLight.fontTitle,
                  ),
                  const SizedBox(width: Const.space15),
                  Text(
                    lang.about_interpretasi,
                    style: theme.textTheme.titleMedium,
                  ),
                ],
              ),
              children: [
                _ListTileWidget(
                  title: lang.about_us,
                  fontSize: 12,
                  onTap: () {
                    // TODO(dickyrey): life_at_kumparan
                  },
                ),
                _ListTileWidget(
                  title: lang.help,
                  fontSize: 12,
                  onTap: () {
                    // TODO(dickyrey): call center
                  },
                ),
                _ListTileWidget(
                  title: lang.privacy_policy,
                  fontSize: 12,
                  onTap: () {
                    // TODO(dickyrey): terms_and_privacy_policy
                  },
                ),
                _ListTileWidget(
                  title: lang.terms_and_condition,
                  fontSize: 12,
                  onTap: () {
                    // TODO(dickyrey): terms_and_privacy_policy
                  },
                ),
              ],
            ),
            _ListTileWidget(
              icon: FeatherIcons.logOut,
              title: lang.sign_out,
              onTap: () {
                showConfirmationDialog(
                  context,
                  title: lang.are_you_sure_want_to_sign_out,
                  primaryButtonLabel: lang.sign_out,
                  onPrimaryButtonTap: () {
                    Navigator.pop(context);
                    context
                        .read<AuthWatcherBloc>()
                        .add(const AuthWatcherEvent.signOut());
                    context
                        .read<UserWatcherBloc>()
                        .add(const UserWatcherEvent.init());
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ListTileWidget extends StatelessWidget {
  const _ListTileWidget({
    super.key,
    required this.title,
    required this.onTap,
    this.icon,
    this.fontSize,
    this.subtitle,
  });

  final String title;
  final String? subtitle;
  final VoidCallback onTap;
  final IconData? icon;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Const.margin,
          vertical: Const.space12,
        ),
        child: Row(
          children: [
            if (icon != null)
              Icon(icon, color: ColorLight.fontTitle)
            else
              const SizedBox(),
            if (icon != null)
              const SizedBox(width: Const.space15)
            else
              const SizedBox(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontSize: fontSize,
                    ),
                  ),
                  const SizedBox(height: 5),
                  if (subtitle != null)
                    Text(subtitle!, style: theme.textTheme.bodyMedium)
                  else
                    const SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
