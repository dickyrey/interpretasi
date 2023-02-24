// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/common/screens.dart';
import 'package:interpretasi/src/presentation/widgets/elevated_button_widget.dart';

class EmptyDataWidget extends StatelessWidget {
  const EmptyDataWidget({
    required this.illustration,
    required this.title,
    required this.subtitle,
    super.key,
    this.onTap,
  });

  final String illustration;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Const.margin,
        vertical: Const.space50,
      ),
      child: Column(
        children: [
          const Spacer(),
          SvgPicture.asset(
            illustration,
            width: Screens.width(context) / 2,
          ),
          const SizedBox(height: Const.space25),
          Text(
            title,
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineLarge,
          ),
          const SizedBox(height: Const.space12),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium,
          ),
          const Spacer(),
          const SizedBox(height: Const.space12),
          if (onTap != null)
            ElevatedButtonWidget(
              onTap: onTap,
              label: lang.start_writing,
            )
          else
            const SizedBox(),
          const Spacer(),
        ],
      ),
    );
  }
}
