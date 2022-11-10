import 'package:flutter/material.dart';
import 'package:lost_app/app/common/widgets/shimmer/shimmer_button.dart';
import 'package:lost_app/app/common/widgets/shimmer/shimmer_text_field.dart';

class ShimmerForm extends StatelessWidget {
  final List<String> fieldsNames;
  final bool hasPadding;

  const ShimmerForm({
    required this.fieldsNames,
    this.hasPadding = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: hasPadding
          ? const EdgeInsets.symmetric(horizontal: 15)
          : EdgeInsets.zero,
      width: double.infinity,
      child: Column(
        children: [
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (_, int index) =>
                ShimmerTextField(textFieldTitle: fieldsNames[index]),
            separatorBuilder: (_, __) => const SizedBox(height: 20),
            itemCount: fieldsNames.length,
          ),
          const SizedBox(height: 30),
          const ShimmerButton()
        ],
      ),
    );
  }
}
