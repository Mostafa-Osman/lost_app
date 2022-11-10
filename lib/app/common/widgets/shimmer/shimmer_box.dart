import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBox extends StatelessWidget {
  final double height;
  final double? width;
  final BorderRadius? borderRadius;
  final Widget? child;
  final Color? baseColor;
  final Color? highlightColor;

  const ShimmerBox({
    this.height = 8,
    this.width = double.infinity - 100,
    this.borderRadius,
    this.child,
    this.baseColor,
    this.highlightColor,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? Colors.grey.shade300.withOpacity(0.70),
      highlightColor: highlightColor ?? Colors.white,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: borderRadius ??
              BorderRadius.circular(height > 24 ? 8 : height / 4),
        ),
        child: child,
      ),
    );
  }
}
