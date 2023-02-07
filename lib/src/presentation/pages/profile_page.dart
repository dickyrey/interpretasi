import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:interpretasi/src/common/colors.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/common/routes.dart';
import 'package:interpretasi/src/presentation/bloc/auth/auth_watcher/auth_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/user/user_form/user_form_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/user/user_watcher/user_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/widgets/dialog_widget.dart';
import 'package:interpretasi/src/presentation/widgets/list_tile_widget.dart';
import 'package:interpretasi/src/presentation/widgets/shimmer_widget.dart';

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
                  loading: (_) {
                    return ShimmerWidget(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 120,
                            height: 120,
                            child: CircleAvatar(
                              radius: 60,
                              backgroundColor: theme.disabledColor,
                            ),
                          ),
                          const SizedBox(height: Const.space15),
                          const ShimmerContainerWidget(),
                          const SizedBox(height: Const.space12),
                          const ShimmerContainerWidget(
                            width: 150,
                          ),
                        ],
                      ),
                    );
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
                                  child: InkWell(
                                    onTap: () {
                                      context.read<UserFormBloc>().add(
                                            UserFormEvent.initialize(
                                              state.user,
                                            ),
                                          );
                                      Navigator.pushNamed(
                                        context,
                                        PROFILE_FORM,
                                      );
                                    },
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
            BlocBuilder<UserWatcherBloc, UserWatcherState>(
              builder: (context, state) {
                return state.maybeMap(
                  orElse: () {
                    return ListTileWidget(
                      icon: FeatherIcons.user,
                      title: lang.my_profile,
                      onTap: () {
                        Navigator.pushNamed(context, PROFILE_DETAIL);
                      },
                    );
                  },
                  loaded: (state) {
                    return ListTileWidget(
                      icon: FeatherIcons.user,
                      title: lang.my_profile,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          PROFILE_DETAIL,
                          arguments: state.user,
                        );
                      },
                    );
                  },
                );
              },
            ),
            ListTileWidget(
              title: lang.my_articles,
              icon: FeatherIcons.fileText,
              onTap: () {
                Navigator.pushNamed(context, MY_ARTICLE);
              },
            ),
            ListTileWidget(
              icon: FeatherIcons.settings,
              title: lang.settings_and_privacy,
              onTap: () {
                Navigator.pushNamed(context, SETTINGS_AND_PRIVACY);
              },
            ),
            ListTileWidget(
              icon: FeatherIcons.clock,
              title: lang.read_history,
              onTap: () {
                Navigator.pushNamed(context, READ_HISTORY);
              },
            ),
            ListTileWidget(
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
                ListTileWidget(
                  title: lang.about_us,
                  fontSize: 12,
                  onTap: () {
                    // TODO(dickyrey): life_at_kumparan
                  },
                ),
                ListTileWidget(
                  title: lang.help,
                  fontSize: 12,
                  onTap: () {
                    // TODO(dickyrey): call center
                  },
                ),
                ListTileWidget(
                  title: lang.privacy_policy,
                  fontSize: 12,
                  onTap: () {
                    // TODO(dickyrey): terms_and_privacy_policy
                  },
                ),
                ListTileWidget(
                  title: lang.terms_and_condition,
                  fontSize: 12,
                  onTap: () {
                    // TODO(dickyrey): terms_and_privacy_policy
                  },
                ),
              ],
            ),
            ListTileWidget(
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
