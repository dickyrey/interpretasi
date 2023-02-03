import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/common/enums.dart';
import 'package:interpretasi/src/common/routes.dart';
import 'package:interpretasi/src/presentation/bloc/auth/auth_watcher/auth_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/auth/sign_in_with_email_form/sign_in_with_email_form_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/auth/sign_in_with_google_actor/sign_in_with_google_actor_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/time_zone_watcher/time_zone_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/widgets/elevated_button_widget.dart';
import 'package:interpretasi/src/presentation/widgets/text_form_field_widget.dart';
import 'package:interpretasi/src/utilities/snackbar.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return MultiBlocListener(
      listeners: [
        BlocListener<SignInWithGoogleActorBloc, SignInWithGoogleActorState>(
          listener: (context, state) {
            state.maybeMap(
              orElse: () {},
              signInFailure: (state) {
                if (state.message == ExceptionMessage.invalidToken) {
                  final snack = showSnackbar(
                    context,
                    type: SnackbarType.error,
                    labelText: 'Terjadi kesalahan mohon coba lagi',
                    labelButton: lang.close,
                    onTap: () {},
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snack);
                }
              },
              signInSuccess: (_) {
                final snack = showSnackbar(
                  context,
                  type: SnackbarType.success,
                  labelText: 'Success',
                  labelButton: lang.close,
                  onTap: () {},
                );
                ScaffoldMessenger.of(context).showSnackBar(snack);
                // context
                //     .read<AuthWatcherBloc>()
                //     .add(const AuthWatcherEvent.authCheckRequested());
                // Navigator.pushNamedAndRemoveUntil(
                //   context,
                //   HOME,
                //   (route) => false,
                // );
              },
            );
          },
        ),
        BlocListener<SignInWithEmailFormBloc, SignInWithEmailFormState>(
          listener: (context, state) {
            if (state.state == RequestState.loaded) {
              context
                  .read<SignInWithEmailFormBloc>()
                  .add(const SignInWithEmailFormEvent.initial());
              Navigator.pushNamedAndRemoveUntil(
                context,
                SPLASH,
                (route) => false,
              );
            } else if (state.state == RequestState.error &&
                state.message == ExceptionMessage.wrongPassword) {
              showSnackbar(
                context,
                type: SnackbarType.error,
                labelText:
                    'Incorrect password. Try again or click Forgot password to reset.',
                labelButton: lang.close,
                onTap: () {},
              );
            } else if (state.state == RequestState.error &&
                state.message == ExceptionMessage.userNotFound) {
              showSnackbar(
                context,
                type: SnackbarType.error,
                labelText: 'Couldnt find the account with that email',
                labelButton: lang.close,
                onTap: () {},
              );
            }
          },
        ),
      ],
      child: BlocBuilder<SignInWithEmailFormBloc, SignInWithEmailFormState>(
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: Const.margin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: Const.space25 * 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Assets.logo,
                        width: 20,
                      ),
                      const SizedBox(width: Const.space12),
                      Text(
                        lang.interpretasi,
                        style: theme.textTheme.headlineSmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: Const.space12),
                  Center(
                    child: Text(
                      lang.explore_information_without_limits,
                      style: theme.textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: Const.space50),
                  Text(
                    lang.your_email_address,
                    style: theme.textTheme.titleMedium,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: Const.space8),
                  TextFormFieldWidget(
                    hintText: lang.captize_gmail_com,
                    textFieldType: TextFieldType.email,
                    onChanged: (v) {
                      context
                          .read<SignInWithEmailFormBloc>()
                          .add(SignInWithEmailFormEvent.emailOnChanged(v));
                    },
                  ),
                  const SizedBox(height: Const.space25),
                  Text(
                    lang.choose_a_password,
                    style: theme.textTheme.titleMedium,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: Const.space8),
                  TextFormFieldWidget(
                    obscureText: state.obscureText,
                    hintText: lang.min_6_characters,
                    suffixIcon: IconButton(
                      onPressed: () {
                        context.read<SignInWithEmailFormBloc>().add(
                              const SignInWithEmailFormEvent
                                  .obscureTextPressed(),
                            );
                      },
                      icon: Icon(
                        state.obscureText == true
                            ? FeatherIcons.eyeOff
                            : FeatherIcons.eye,
                      ),
                    ),
                    onChanged: (v) {
                      context
                          .read<SignInWithEmailFormBloc>()
                          .add(SignInWithEmailFormEvent.emailOnChanged(v));
                    },
                  ),
                  const SizedBox(height: Const.space25),
                  ElevatedButtonWidget(
                    label: lang.login,
                    isLoading: (state.isSubmitting == true) ? true : false,
                    onTap: () {
                      context
                          .read<SignInWithEmailFormBloc>()
                          .add(const SignInWithEmailFormEvent.signInPressed());
                    },
                  ),
                  const SizedBox(height: Const.space8),
                  Align(
                    child: TextButton(
                      onPressed: () => Navigator.pushNamed(
                        context,
                        FORGOT_PASSWORD,
                      ),
                      child: Text(
                        lang.forgot_password,
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.primaryColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: Const.space12),
                  Row(
                    children: [
                      const Expanded(child: Divider(thickness: 1.5)),
                      const SizedBox(width: Const.space12),
                      Text(
                        lang.or,
                        style: theme.textTheme.bodySmall,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(width: Const.space12),
                      const Expanded(child: Divider(thickness: 1.5)),
                    ],
                  ),
                  const SizedBox(height: Const.space25),
                  ElevatedButtonWidget(
                    color: theme.colorScheme.background,
                    margin:
                        const EdgeInsets.symmetric(horizontal: Const.margin),
                    elevation: 1,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          Assets.google,
                          width: 20,
                        ),
                        const SizedBox(width: Const.space15),
                        Text(
                          lang.sign_in_with_google,
                          style: theme.textTheme.titleMedium,
                        )
                      ],
                    ),
                    onTap: () {
                      final state = context.read<TimeZoneWatcherBloc>().state;
                      String generateSHA256(String data) {
                        final bytes = utf8.encode(data);
                        final hash = sha256.convert(bytes);
                        return hash.toString();
                      }

                      context.read<SignInWithGoogleActorBloc>().add(
                            SignInWithGoogleActorEvent.googleSignIn(
                              generateSHA256(state.dateTime),
                            ),
                          );
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
