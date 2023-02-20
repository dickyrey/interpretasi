import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/common/enums.dart';
import 'package:interpretasi/src/common/routes.dart';
import 'package:interpretasi/src/presentation/bloc/password/forgot_password_form/forgot_password_form_bloc.dart';
import 'package:interpretasi/src/presentation/widgets/elevated_button_widget.dart';
import 'package:interpretasi/src/utilities/snackbar.dart';
import 'package:lottie/lottie.dart';

class ForgotPasswordSuccessPage extends StatelessWidget {
  const ForgotPasswordSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: _appBar(context),
      body: Padding(
        padding: const EdgeInsets.all(Const.margin),
        child: Column(
          children: [
            Expanded(
              flex: 9,
              child: Lottie.asset(
                Assets.emailVerification,
                repeat: true,
              ),
            ),
            const SizedBox(height: Const.space25),
            Text(
              lang.change_a_new_password,
              style: theme.textTheme.headlineMedium,
            ),
            const SizedBox(height: Const.space15),
            Text(
              '${lang.we_have_sent_an_email_to} ${lang.your_email_address}, ${lang.please_check_and_click_set_password_on_the_email}',
              style: theme.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: Const.space25),
            ElevatedButtonWidget(
              onTap: () {
                context
                    .read<ForgotPasswordFormBloc>()
                    .add(const ForgotPasswordFormEvent.init());
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  LOGIN,
                  (route) => false,
                );
              },
              label: lang.go_back,
            ),
            const SizedBox(height: Const.space25),
            Text(
              lang.havent_received_the_verification_email_yet,
              style: theme.textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            TextButton(
              onPressed: () {
                // TODO(dickyrey): Navigate to Call Center
                final snack = showSnackbar(
                  context,
                  type: SnackbarType.info,
                  labelText: 'Belum tersedia',
                  labelButton: lang.close,
                  onTap: () {},
                );
                ScaffoldMessenger.of(context).showSnackBar(snack);
              },
              child: Text(
                lang.contact_us,
                style: theme.textTheme.titleLarge?.copyWith(
                  color: theme.primaryColor,
                ),
              ),
            ),
            const Expanded(flex: 2, child: SizedBox()),
          ],
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      backgroundColor: theme.colorScheme.background,
      leading: IconButton(
        onPressed: () {
          context
              .read<ForgotPasswordFormBloc>()
              .add(const ForgotPasswordFormEvent.init());
           Navigator.pushNamedAndRemoveUntil(
                  context,
                  LOGIN,
                  (route) => false,
                );
        },
        icon: Icon(
          FeatherIcons.arrowLeft,
          color: theme.iconTheme.color,
        ),
      ),
    );
  }
}
