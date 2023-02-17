// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/common/screens.dart';
import 'package:interpretasi/src/presentation/widgets/elevated_button_widget.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Const.margin,
          vertical: Const.space50,
        ),
        child: Column(
          children: [
            const Spacer(),
            SvgPicture.asset(
              Assets.error,
              width: Screens.width(context) / 1.5,
            ),
            const SizedBox(height: Const.space50),
            Text(
              lang.something_went_wrong,
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineLarge,
            ),
            const SizedBox(height: Const.space15),
            Text(
              lang.we_encountered_an_error_while_trying_to_connect_to_our_server_please_try_after_some_again,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium,
            ),
            const Spacer(),
            ElevatedButtonWidget(
              onTap: () {
                Navigator.pop(context);
              },
              label: lang.go_back,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
