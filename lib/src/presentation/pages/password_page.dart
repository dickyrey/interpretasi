import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/common/enums.dart';
import 'package:interpretasi/src/common/routes.dart';
import 'package:interpretasi/src/presentation/bloc/auth/verification_status_watcher/verification_status_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/password/password_form_bloc.dart';
import 'package:interpretasi/src/presentation/widgets/elevated_button_widget.dart';
import 'package:interpretasi/src/presentation/widgets/text_form_field_widget.dart';
import 'package:interpretasi/src/utilities/snackbar.dart';

class PasswordPage extends StatefulWidget {
  const PasswordPage({super.key, this.isFromSetting = false});
  final bool isFromSetting;

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return WillPopScope(
      onWillPop: () async {
        context
            .read<VerificationStatusWatcherBloc>()
            .add(const VerificationStatusWatcherEvent.fetchStatus());
        return true;
      },
      child: BlocConsumer<PasswordFormBloc, PasswordFormState>(
        listener: (context, state) {
          if (state.message == ExceptionMessage.internetNotConnected) {
            final snack = showSnackbar(
              context,
              type: SnackbarType.error,
              labelText: lang.something_went_wrong,
              labelButton: lang.close,
              onTap: () {},
            );
            ScaffoldMessenger.of(context).showSnackBar(snack);
          } else if (state.state == RequestState.loaded) {
            if (widget.isFromSetting == true) {
              final snack = showSnackbar(
                context,
                type: SnackbarType.success,
                labelText: lang.password_added,
                labelButton: lang.close,
                onTap: () {},
              );
              ScaffoldMessenger.of(context).showSnackBar(snack);
              Navigator.pop(context);
            } else {
              // TODO(dickyrey): Navigate to Loading screen for auto sign in
              Navigator.pushNamedAndRemoveUntil(
                context,
                HOME,
                (route) => false,
              );
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: _appBar(context),
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: Const.margin),
              child: Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: Const.space25),
                    Text(
                      lang.create_a_new_password,
                      style: theme.textTheme.headlineLarge?.copyWith(
                        color: theme.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: Const.space12),
                    Text(
                      lang.create_a_new_password_so_your_account_will_be_more_secure,
                      style: theme.textTheme.bodyLarge,
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: Const.space50),
                    Text(
                      lang.choose_a_password,
                      style: theme.textTheme.titleMedium,
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: Const.space8),
                    TextFormFieldWidget(
                      obscureText: state.obscureText,
                      hintText: lang.pasword_hint_,
                      suffixIcon: IconButton(
                        onPressed: () {
                          context.read<PasswordFormBloc>().add(
                                const PasswordFormEvent.obscureTextPressed(),
                              );
                        },
                        icon: Icon(
                          (state.obscureText == true)
                              ? FeatherIcons.eye
                              : FeatherIcons.eyeOff,
                        ),
                      ),
                      onChanged: (value) {
                        context
                            .read<PasswordFormBloc>()
                            .add(PasswordFormEvent.passwordOnChanged(value));
                      },
                    ),
                    const SizedBox(height: Const.space25),
                    Text(
                      lang.confirm_password,
                      style: theme.textTheme.titleMedium,
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: Const.space8),
                    TextFormFieldWidget(
                      obscureText: state.obscureText,
                      hintText: lang.pasword_hint_,
                      suffixIcon: IconButton(
                        onPressed: () {
                          context.read<PasswordFormBloc>().add(
                                const PasswordFormEvent.obscureTextPressed(),
                              );
                        },
                        icon: Icon(
                          (state.obscureText == true)
                              ? FeatherIcons.eye
                              : FeatherIcons.eyeOff,
                        ),
                      ),
                      onChanged: (value) {
                        context.read<PasswordFormBloc>().add(
                              PasswordFormEvent.repeatPasswordOnChanged(value),
                            );
                      },
                    ),
                    const SizedBox(height: Const.space25),
                    ElevatedButtonWidget(
                      onTap: () {
                        if (!formKey.currentState!.validate()) {
                        } else if (state.password != state.repeatPassword) {
                          final snack = showSnackbar(
                            context,
                            type: SnackbarType.error,
                            labelText: lang.passwords_are_not_the_same,
                            labelButton: lang.close,
                            onTap: () {},
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snack);
                        } else {
                          context.read<PasswordFormBloc>().add(
                                const PasswordFormEvent.addPasswordPressed(),
                              );
                        }
                      },
                      label: lang.save,
                      labelLoading: lang.please_wait,
                      isLoading: (state.isSubmitting == true) ? true : false,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return AppBar(
      backgroundColor: theme.colorScheme.background,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(
          FeatherIcons.arrowLeft,
          color: theme.iconTheme.color,
        ),
      ),
      title: Text(
        lang.password,
        style: theme.textTheme.headlineSmall,
      ),
    );
  }
}
