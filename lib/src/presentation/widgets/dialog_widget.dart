import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:interpretasi/src/common/colors.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/presentation/widgets/elevated_button_widget.dart';
import 'package:interpretasi/src/presentation/widgets/outlined_button_widget.dart';

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
        backgroundColor: ColorLight.card,
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
                        textColor: Colors.white,
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
