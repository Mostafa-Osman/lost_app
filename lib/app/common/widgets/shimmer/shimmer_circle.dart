import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCircle extends StatelessWidget {
  final double width;
  final Color? highlightColor;
  final Color? baseColor;

  const ShimmerCircle({
    this.width = 24,
    this.highlightColor,
    this.baseColor,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: highlightColor ?? Colors.grey.shade100,
      baseColor: baseColor ?? Colors.grey.shade300,
      child: Container(
        height: width,
        width: width,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.shade300,
        ),
      ),
    );
  }
}
