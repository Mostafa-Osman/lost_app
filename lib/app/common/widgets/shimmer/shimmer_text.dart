import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TextShimmerWidget extends StatelessWidget {
  final String text;
  final double? fontSize;

  const TextShimmerWidget({
    required this.text,
    this.fontSize = 14,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Colors.grey.shade100,
      baseColor: Colors.grey.shade300,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
        ),
      ),
    );
  }
}
