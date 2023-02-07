import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/common/enums.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    this.controller,
    this.hintText,
    this.onSubmitted,
    this.showBorder = false,
  });

  final TextEditingController? controller;
  final String? hintText;
  final ValueChanged<String>? onSubmitted;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextField(
      controller: controller,
      onSubmitted: onSubmitted,
      style: theme.textTheme.titleMedium,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: theme.textTheme.bodyMedium,
        helperStyle: theme.textTheme.bodySmall,
        contentPadding: const EdgeInsets.symmetric(horizontal: Const.space12),
        enabledBorder: (showBorder == true)
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(Const.radius),
                borderSide: BorderSide(color: theme.disabledColor),
              )
            : InputBorder.none,
        focusedBorder: (showBorder == true)
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(Const.radius),
                borderSide: BorderSide(color: theme.primaryColor),
              )
            : InputBorder.none,
        errorBorder: (showBorder == true)
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(Const.radius),
                borderSide: BorderSide(color: theme.colorScheme.error),
              )
            : InputBorder.none,
        focusedErrorBorder: (showBorder == true)
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(Const.radius),
                borderSide: BorderSide(color: theme.colorScheme.error),
              )
            : InputBorder.none,
        disabledBorder: (showBorder == true)
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(Const.radius),
                borderSide: BorderSide(color: theme.disabledColor),
              )
            : InputBorder.none,
      ),
    );
  }
}
