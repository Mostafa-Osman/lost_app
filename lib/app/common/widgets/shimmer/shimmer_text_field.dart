import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerTextField extends StatelessWidget {
  final String textFieldTitle;
  final double? height;

  const ShimmerTextField({
    required this.textFieldTitle,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            textFieldTitle,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 5,
          ),
          Shimmer.fromColors(
            highlightColor: Colors.grey.shade100,
            baseColor: Colors.grey.shade300,
            child: Container(
              height: height ?? 56,
              decoration: BoxDecoration(
                color: const Color(0xffF2F2F2),
                borderRadius: BorderRadius.circular(9),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
