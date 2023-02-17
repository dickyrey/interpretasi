import 'package:flutter/material.dart';
import 'package:interpretasi/src/common/const.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    required this.title,
    required this.onTap,
    super.key,
    this.subtitle,
    this.icon,
    this.fontSize,
  });

  final String title;
  final String? subtitle;
  final VoidCallback onTap;
  final IconData? icon;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Const.margin,
          vertical: Const.space12,
        ),
        child: Row(
          children: [
            if (icon != null)
              Icon(
                icon,
                color: theme.iconTheme.color,
              )
            else
              const SizedBox(),
            if (icon != null)
              const SizedBox(width: Const.space15)
            else
              const SizedBox(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontSize: fontSize,
                    ),
                  ),
                  const SizedBox(height: 5),
                  if (subtitle != null)
                    Text(subtitle!, style: theme.textTheme.bodySmall)
                  else
                    const SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
