import 'package:flutter/material.dart';
import 'package:interpretasi/src/common/const.dart';

class OutlinedButtonWidget extends StatelessWidget {
  const OutlinedButtonWidget({
    super.key,
    this.width = double.infinity,
    this.height = 47,
    this.margin,
    this.isLoading = false,
    required this.onTap,
    this.borderColor,
    this.labelColor,
    this.backgroundColor,
    required this.label,
    this.icon,
  });

  final double width;
  final double height;
  final EdgeInsetsGeometry? margin;
  final VoidCallback onTap;
  final bool isLoading;
  final Color? borderColor;
  final Color? labelColor;
  final Color? backgroundColor;
  final String label;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: width,
      height: height,
      margin: margin,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Const.radius),
          ),
          side: BorderSide(
            color: borderColor ?? theme.primaryColor,
          ),
        ),
        onPressed: (isLoading == true) ? () {} : onTap,
        child: (icon != null)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon!,
                  const SizedBox(width: Const.space8),
                  Text(
                    label,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: (labelColor == null)
                          ? theme.primaryColor
                          : labelColor,
                    ),
                  ),
                ],
              )
            : Text(
                label,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: (labelColor == null) ? theme.primaryColor : labelColor,
                ),
              ),
      ),
    );
  }
}
