// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/common/enums.dart';
import 'package:interpretasi/src/common/routes.dart';
import 'package:interpretasi/src/presentation/bloc/auth/auth_watcher/auth_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/auth/sign_in_with_google_actor/sign_in_with_google_actor_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/auth/sign_up_with_email_form/sign_up_with_email_form_bloc.dart';
import 'package:interpretasi/src/presentation/widgets/elevated_button_widget.dart';
import 'package:interpretasi/src/presentation/widgets/text_form_field_widget.dart';
import 'package:interpretasi/src/utilities/snackbar.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
              signInProgress: (_) {
                final snack = showSnackbar(
                  context,
                  type: SnackbarType.info,
                  labelText: lang.please_wait,
                  labelButton: lang.close,
                  onTap: () {},
                );
                ScaffoldMessenger.of(context).showSnackBar(snack);
              },
              signInFailure: (state) {
                if (state.message == ExceptionMessage.invalidToken) {
                  final snack = showSnackbar(
                    context,
                    type: SnackbarType.error,
                    labelText: lang.something_went_wrong,
                    labelButton: lang.close,
                    onTap: () {},
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snack);
                }
              },
              signInSuccess: (_) {
                context
                    .read<AuthWatcherBloc>()
                    .add(const AuthWatcherEvent.check());
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  HOME,
                  (route) => false,
                );
              },
            );
          },
        ),
        BlocListener<SignUpWithEmailFormBloc, SignUpWithEmailFormState>(
          listener: (context, state) {
            if (state.message == ExceptionMessage.internetNotConnected) {
              alertDialog(
                context,
                text: lang.something_went_wrong,
                onTap: () {
                  Navigator.pop(context);
                  context
                      .read<SignUpWithEmailFormBloc>()
                      .add(const SignUpWithEmailFormEvent.init());
                },
              );
            } else if (state.state == RequestState.loaded) {
              alertDialog(
                context,
                text: lang
                    .you_are_already_registered_check_your_email_for_verification,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(
                    context,
                    EMAIL_VERIFICATION,
                  );
                },
              );
            } else if (state.message == ExceptionMessage.userAlreadyExist) {
              final snack = showSnackbar(
                context,
                type: SnackbarType.error,
                labelText: lang.looks_like_your_email_has_been_registered,
                labelButton: lang.close,
                onTap: () {},
              );
              ScaffoldMessenger.of(context).showSnackBar(snack);
            }
          },
        ),
      ],
      child: BlocBuilder<SignUpWithEmailFormBloc, SignUpWithEmailFormState>(
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: Const.margin),
              child: Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: Const.space25 * 3),
                    Text(
                      lang.create_a_new_account,
                      style: theme.textTheme.headlineLarge?.copyWith(
                        color: theme.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: Const.space12),
                    Text(
                      lang.create_a_new_account_so_you_can_enjoy_more_feature_in_interpretasi,
                      style: theme.textTheme.bodyLarge,
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: Const.space25),
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
                            .read<SignUpWithEmailFormBloc>()
                            .add(SignUpWithEmailFormEvent.email(v));
                      },
                    ),
                    const SizedBox(height: Const.space25),
                    ElevatedButtonWidget(
                      label: lang.register,
                      labelLoading: lang.please_wait,
                      isLoading: state.isSubmit,
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          context.read<SignUpWithEmailFormBloc>().add(
                                const SignUpWithEmailFormEvent.signUp(),
                              );
                        }
                      },
                    ),
                    const SizedBox(height: Const.space25),
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
                    const SizedBox(height: Const.space15),
                    ElevatedButtonWidget(
                      color: theme.colorScheme.background,
                      margin: const EdgeInsets.symmetric(
                        horizontal: Const.margin,
                      ),
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
                            lang.sign_up_with_google,
                            style: theme.textTheme.titleMedium,
                          )
                        ],
                      ),
                      onTap: () {
                        context.read<SignInWithGoogleActorBloc>().add(
                              const SignInWithGoogleActorEvent.signIn(),
                            );
                      },
                    ),
                    const SizedBox(height: Const.space25),
                    Center(
                      child: TextButton(
                        onPressed: () => Navigator.pushNamedAndRemoveUntil(
                          context,
                          LOGIN,
                          (route) => false,
                        ),
                        style: TextButton.styleFrom(
                          foregroundColor: theme.disabledColor,
                        ),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '${lang.already_have_an_account} ',
                                style: theme.textTheme.titleMedium,
                              ),
                              TextSpan(
                                text: lang.login,
                                style: theme.textTheme.titleMedium?.copyWith(
                                  color: theme.primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: Const.space15,
                      ),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontSize: 12,
                          ),
                          children: [
                            TextSpan(
                              text:
                                  '${lang.by_registering_logging_into_interpretasi_you_agree_to_that} ',
                            ),
                            TextSpan(
                              text: '${lang.terms_and_privacy_policy} ',
                              style: theme.textTheme.titleLarge?.copyWith(
                                color: theme.primaryColor,
                                fontSize: 12,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // TODO(dickyrey): Navigate to Privacy Policy Page
                                },
                            ),
                            TextSpan(
                              text: lang.applies,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: Const.space25),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Future<dynamic> alertDialog(
  BuildContext context, {
  required String text,
  required VoidCallback onTap,
}) {
  final theme = Theme.of(context);
  final lang = AppLocalizations.of(context)!;

  return showDialog<dynamic>(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        actions: [
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButtonWidget(
              width: 80,
              height: 35,
              onTap: onTap,
              label: lang.close,
              labelSize: 12,
            ),
          ),
        ],
        content: Text(
          text,
          style: theme.textTheme.titleMedium,
        ),
      );
    },
  );
}
