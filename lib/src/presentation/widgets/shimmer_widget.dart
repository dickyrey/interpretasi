import 'package:flutter/material.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Shimmer.fromColors(
      baseColor: theme.disabledColor,
      highlightColor: theme.primaryColor.withOpacity(.1),
      child: child,
    );
  }
}

class ShimmerContainerWidget extends StatelessWidget {
  const ShimmerContainerWidget({
    super.key,
    this.width = 100,
    this.height = 10,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: theme.disabledColor,
        borderRadius: BorderRadius.circular(Const.radius),
      ),
    );
  }
}
