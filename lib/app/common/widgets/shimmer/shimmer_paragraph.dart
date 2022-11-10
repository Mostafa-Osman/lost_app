import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ParagraphShimmer extends StatelessWidget {
  const ParagraphShimmer();

  @override
  Widget build(BuildContext context) {
    const itemCount = 15;
    return Shimmer.fromColors(
      highlightColor: Colors.grey.shade100,
      baseColor: Colors.grey.shade300,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (ctx, i) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextShimmer(isLast: i == itemCount - 1),
            ],
          ),
          separatorBuilder: (ctx, i) => const SizedBox(height: 5),
          itemCount: itemCount,
        ),
      ),
    );
  }
}

class CustomTextShimmer extends StatelessWidget {
  final bool isLast;

  const CustomTextShimmer({required this.isLast});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      height: 10,
      width: isLast
          ? MediaQuery.of(context).size.width * 0.75
          : MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
