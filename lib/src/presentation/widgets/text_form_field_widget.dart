import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/common/enums.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    this.controller,
    this.textFieldType = TextFieldType.text,
    this.hintText,
    this.helperText,
    this.onChanged,
    this.maxLength,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.maxLines = 1,
    this.helperMaxLines,
    this.textAlign = TextAlign.left,
    this.inputFormatters,
    this.enabled = true,
    this.textInputAction,
    this.textInputType,
    this.minLength = 1,
    this.errorText,
  });

  final TextEditingController? controller;
  final TextFieldType textFieldType;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  final int? maxLines;
  final int? helperMaxLines;
  final int? maxLength;
  final TextAlign? textAlign;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;
  final ValueChanged<String>? onChanged;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final int minLength;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    TextInputType keyboardType(TextFieldType textFieldType) {
      switch (textFieldType) {
        case TextFieldType.email:
          return TextInputType.emailAddress;
        case TextFieldType.text:
          return TextInputType.text;
        case TextFieldType.phone:
          return TextInputType.phone;
      }
    }

    MultiValidator validatorOption(
      TextFieldType textFieldType, {
      String? errorText,
    }) {
      switch (textFieldType) {
        case TextFieldType.email:
          return MultiValidator([
            RequiredValidator(
              errorText: lang.enter_your_email_address,
            ),
            EmailValidator(
              errorText: lang.invalid_email_address_format,
            )
          ]);
        case TextFieldType.text:
          return MultiValidator([
            RequiredValidator(
              errorText: errorText ?? lang.cannot_be_empty,
            ),
            MinLengthValidator(
              minLength,
              errorText: errorText ?? lang.text_too_short,
            )
          ]);
        case TextFieldType.phone:
          return MultiValidator([
            RequiredValidator(
              errorText: errorText ?? lang.enter_your_phone_number,
            ),
            MinLengthValidator(
              7,
              errorText: lang.invalid_phone_number_format,
            ),
            PatternValidator(
              r'^[0-9]+$',
              errorText: lang.invalid_phone_number_format,
            ),
          ]);
      }
    }

    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      maxLength: maxLength,
      enabled: enabled,
      onChanged: onChanged,
      textAlign: textAlign ?? TextAlign.left,
      obscureText: obscureText ?? false,
      style: theme.textTheme.titleMedium,
      inputFormatters: inputFormatters ?? [],
      keyboardType: textInputType ?? keyboardType(textFieldType),
      validator: validatorOption(textFieldType, errorText: errorText).call,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: theme.textTheme.bodyMedium,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        helperMaxLines: helperMaxLines,
        helperText: helperText,
        helperStyle: theme.textTheme.bodySmall,
        contentPadding: const EdgeInsets.symmetric(horizontal: Const.space12),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Const.radius),
          borderSide: BorderSide(color: theme.disabledColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Const.radius),
          borderSide: BorderSide(color: theme.primaryColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Const.radius),
          borderSide: BorderSide(color: theme.colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Const.radius),
          borderSide: BorderSide(color: theme.colorScheme.error),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Const.radius),
          borderSide: BorderSide(color: theme.disabledColor),
        ),
      ),
    );
  }
}
