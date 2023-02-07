import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/common/enums.dart';
import 'package:interpretasi/src/presentation/bloc/password/change_password_form/change_password_form_bloc.dart';
import 'package:interpretasi/src/presentation/widgets/elevated_button_widget.dart';
import 'package:interpretasi/src/presentation/widgets/text_form_field_widget.dart';
import 'package:interpretasi/src/utilities/snackbar.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return BlocConsumer<ChangePasswordFormBloc, ChangePasswordFormState>(
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
        } else if (state.message == ExceptionMessage.wrongOldPassword) {
          final snack = showSnackbar(
            context,
            type: SnackbarType.error,
            labelText: lang.old_password_is_wrong,
            labelButton: lang.close,
            onTap: () {},
          );
          ScaffoldMessenger.of(context).showSnackBar(snack);
        } else if (state.state == RequestState.loaded) {
          final snack = showSnackbar(
            context,
            type: SnackbarType.success,
            labelText: lang.password_changed,
            labelButton: lang.close,
            onTap: () {},
          );
          ScaffoldMessenger.of(context).showSnackBar(snack);
          Navigator.pop(context);
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
                    lang.change_a_new_password,
                    style: theme.textTheme.headlineLarge?.copyWith(
                      color: theme.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: Const.space12),
                  Text(
                    lang.change_a_new_password_so_your_account_will_be_more_secure,
                    style: theme.textTheme.bodyLarge,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: Const.space50),
                  Text(
                    lang.your_old_password,
                    style: theme.textTheme.titleMedium,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: Const.space8),
                  TextFormFieldWidget(
                    obscureText: state.isObscure,
                    hintText: lang.pasword_hint_,
                    suffixIcon: IconButton(
                      onPressed: () {
                        context
                            .read<ChangePasswordFormBloc>()
                            .add(const ChangePasswordFormEvent.obscureText());
                      },
                      icon: Icon(
                        (state.isObscure == true)
                            ? FeatherIcons.eye
                            : FeatherIcons.eyeOff,
                      ),
                    ),
                    onChanged: (v) {
                      context
                          .read<ChangePasswordFormBloc>()
                          .add(ChangePasswordFormEvent.oldPassword(v));
                    },
                  ),
                  const SizedBox(height: Const.space25),
                  Text(
                    lang.new_password,
                    style: theme.textTheme.titleMedium,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: Const.space8),
                  TextFormFieldWidget(
                    obscureText: state.isObscure,
                    hintText: lang.pasword_hint_,
                    suffixIcon: IconButton(
                      onPressed: () {
                        context
                            .read<ChangePasswordFormBloc>()
                            .add(const ChangePasswordFormEvent.obscureText());
                      },
                      icon: Icon(
                        (state.isObscure == true)
                            ? FeatherIcons.eye
                            : FeatherIcons.eyeOff,
                      ),
                    ),
                    onChanged: (v) {
                      context
                          .read<ChangePasswordFormBloc>()
                          .add(ChangePasswordFormEvent.newPassword(v));
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
                    obscureText: state.isObscure,
                    hintText: lang.pasword_hint_,
                    suffixIcon: IconButton(
                      onPressed: () {
                        context.read<ChangePasswordFormBloc>().add(
                              const ChangePasswordFormEvent.obscureText(),
                            );
                      },
                      icon: Icon(
                        (state.isObscure == true)
                            ? FeatherIcons.eye
                            : FeatherIcons.eyeOff,
                      ),
                    ),
                    onChanged: (v) {
                      context
                          .read<ChangePasswordFormBloc>()
                          .add(ChangePasswordFormEvent.confirmPassword(v));
                    },
                  ),
                  const SizedBox(height: Const.space25),
                  ElevatedButtonWidget(
                    onTap: () {
                      if (!formKey.currentState!.validate()) {
                      } else if (state.newPassword !=
                          state.confirmationPassword) {
                        final snack = showSnackbar(
                          context,
                          type: SnackbarType.error,
                          labelText: lang.passwords_are_not_the_same,
                          labelButton: lang.close,
                          onTap: () {},
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snack);
                      } else {
                        context
                            .read<ChangePasswordFormBloc>()
                            .add(const ChangePasswordFormEvent.change());
                      }
                    },
                    label: lang.save,
                    labelLoading: lang.please_wait,
                    isLoading: (state.isSubmit == true) ? true : false,
                  ),
                ],
              ),
            ),
          ),
        );
      },
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
