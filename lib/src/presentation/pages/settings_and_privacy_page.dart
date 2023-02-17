import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/common/routes.dart';
import 'package:interpretasi/src/presentation/bloc/auth/verification_status_watcher/verification_status_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/user/user_form/user_form_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/user/user_watcher/user_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/widgets/list_tile_widget.dart';

class SettingsAndPrivacyPage extends StatefulWidget {
  const SettingsAndPrivacyPage({super.key});

  @override
  State<SettingsAndPrivacyPage> createState() => _SettingsAndPrivacyPageState();
}

class _SettingsAndPrivacyPageState extends State<SettingsAndPrivacyPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context
          .read<VerificationStatusWatcherBloc>()
          .add(const VerificationStatusWatcherEvent.fetch()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: _appBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: Const.space12),
            BlocBuilder<UserWatcherBloc, UserWatcherState>(
              builder: (context, state) {
                return state.maybeMap(
                  orElse: () {
                    return const SizedBox();
                  },
                  loaded: (state) {
                    return ListTileWidget(
                      title: lang.personal_data,
                      icon: FeatherIcons.user,
                      onTap: () {
                        context
                            .read<UserFormBloc>()
                            .add(UserFormEvent.initialize(state.user));
                        Navigator.pushNamed(context, PROFILE_FORM);
                      },
                    );
                  },
                );
              },
            ),
            BlocBuilder<UserWatcherBloc, UserWatcherState>(
              builder: (context, state) {
                return state.maybeMap(
                  orElse: () {
                    return const SizedBox();
                  },
                  loaded: (state) {
                    return ListTileWidget(
                      title: lang.email_address,
                      subtitle: state.user.email,
                      icon: FeatherIcons.mail,
                      onTap: () {
                        // TODO(dickyrey): Email Verification Success / Done
                        // Navigator.pushNamed(context, ADD_SECOND_EMAIL);
                      },
                    );
                  },
                );
              },
            ),
            BlocBuilder<VerificationStatusWatcherBloc,
                VerificationStatusWatcherState>(
              builder: (context, state) {
                return state.maybeMap(
                  orElse: () {
                    return ListTileWidget(
                      title: lang.password,
                      icon: FeatherIcons.lock,
                      onTap: () {},
                    );
                  },
                  loaded: (state) {
                    return ListTileWidget(
                      title: lang.password,
                      subtitle: (state.status.isSetPassword != true)
                          ? lang.not_added_yet
                          : null,
                      icon: FeatherIcons.lock,
                      onTap: () {
                        if (state.status.isSetPassword != true) {
                          Navigator.pushNamed(
                            context,
                            PASSWORD,
                            arguments: true,
                          );
                        } else {
                          Navigator.pushNamed(
                            context,
                            CHANGE_PASSWORD,
                            arguments: true,
                          );
                        }
                      },
                    );
                  },
                );
              },
            ),
            // ListTileWidget(
            //   title: lang.notification,
            //   icon: FeatherIcons.bell,
            //   onTap: () {
                // TODO(dickyrey): Notification Settings
                // Navigator.pushNamed(context, INTEREST_SETTING);
            //   },
            // ),
            ListTileWidget(
              title: lang.dark_mode,
              icon: FeatherIcons.moon,
              onTap: () {
                Navigator.pushNamed(context, THEME_SETTING);
              },
            ),
            ListTileWidget(
              title: lang.change_language,
              icon: FeatherIcons.globe,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  LANGUAGE,
                );
              },
            ),
          ],
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
        lang.settings_and_privacy,
        style: theme.textTheme.headlineSmall,
      ),
    );
  }
}
