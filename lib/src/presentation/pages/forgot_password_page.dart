import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/common/enums.dart';
import 'package:interpretasi/src/common/routes.dart';
import 'package:interpretasi/src/presentation/bloc/password/forgot_password_form/forgot_password_form_bloc.dart';
import 'package:interpretasi/src/presentation/widgets/elevated_button_widget.dart';
import 'package:interpretasi/src/presentation/widgets/text_form_field_widget.dart';
import 'package:interpretasi/src/utilities/snackbar.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;
    return BlocConsumer<ForgotPasswordFormBloc, ForgotPasswordFormState>(
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
        } else if (state.message == ExceptionMessage.userNotFound) {
          final snack = showSnackbar(
            context,
            type: SnackbarType.error,
            labelText: lang.user_not_found,
            labelButton: lang.close,
            onTap: () {},
          );
          ScaffoldMessenger.of(context).showSnackBar(snack);
        } else if (state.state == RequestState.loaded) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            FORGOT_PASSWORD_SUCCESS,
            (route) => false,
          );
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
                    lang.forgot_password,
                    style: theme.textTheme.headlineLarge?.copyWith(
                      color: theme.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: Const.space12),
                  Text(
                    lang.dont_worry_it_happens_please_enter_email_address_associated_with_your_account,
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
                          .read<ForgotPasswordFormBloc>()
                          .add(ForgotPasswordFormEvent.email(v));
                    },
                  ),
                  const SizedBox(height: Const.space25),
                  ElevatedButtonWidget(
                    label: lang.send,
                    labelLoading: lang.please_wait,
                    isLoading: (state.isSubmit == true) ? true : false,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        context.read<ForgotPasswordFormBloc>().add(
                              const ForgotPasswordFormEvent.send(),
                            );
                      }
                    },
                  ),
                  const SizedBox(height: Const.space25),
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
    return AppBar(
      backgroundColor: theme.colorScheme.background,
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
