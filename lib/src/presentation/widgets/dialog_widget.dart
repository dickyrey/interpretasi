import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:interpretasi/src/common/colors.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/presentation/widgets/elevated_button_widget.dart';
import 'package:interpretasi/src/presentation/widgets/outlined_button_widget.dart';

class TileButtonDialog extends StatelessWidget {
  const TileButtonDialog({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
    this.color,
    this.padding,
  });

  final String label;
  final IconData icon;
  final VoidCallback onTap;
  final Color? color;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: SizedBox(
        height: 40,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(Const.radius),
          child: Row(
            children: [
              Icon(
                icon,
                size: 18,
                color: color ?? ColorLight.fontTitle,
              ),
              const SizedBox(width: Const.space12),
              Text(
                label,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: color ?? ColorLight.fontTitle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<dynamic> showMultiButtonDialog(
  BuildContext context, {
  required List<TileButtonDialog> items,
}) {
  final theme = Theme.of(context);
  final lang = AppLocalizations.of(context)!;

  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: theme.cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Const.radius),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              lang.choose_an_action,
              style: theme.textTheme.labelMedium,
            ),
            InkWell(
              radius: 30,
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(FeatherIcons.x),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: items,
        ),
      );
    },
  );
}

Future<dynamic> showConfirmationDialog(
  BuildContext context, {
  bool barrierDismissible = false,
  required String title,
  required String primaryButtonLabel,
  String? secondaryButtonLabel,
  required VoidCallback onPrimaryButtonTap,
  VoidCallback? onSecondaryButtonTap,
}) {
  final theme = Theme.of(context);
  return showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (context) {
      return AlertDialog(
        backgroundColor: theme.cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Const.radius),
        ),
        content: SizedBox(
          width: MediaQuery.of(context).size.width - 80,
          height: 150,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: theme.textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: Const.space50),
              SizedBox(
                height: 35,
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButtonWidget(
                        onTap: (onSecondaryButtonTap == null)
                            ? () => Navigator.pop(context)
                            : onSecondaryButtonTap,
                        label: (secondaryButtonLabel == null)
                            ? AppLocalizations.of(context)!.cancel
                            : secondaryButtonLabel,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: ElevatedButtonWidget(
                        onTap: onPrimaryButtonTap,
                        label: primaryButtonLabel,
                        color: theme.primaryColor,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
