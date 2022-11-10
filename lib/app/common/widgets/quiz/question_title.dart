import 'package:flutter/material.dart';

import 'package:lost_app/app/common/themes/app_theme.dart';

class QuestionTitle extends StatelessWidget {
  final String title;
  final int currentQuestionNumber;
  final int numberOfQuestions;
  final bool isRtl;

  const QuestionTitle({
    required this.title,
    required this.currentQuestionNumber,
    required this.numberOfQuestions,
    this.isRtl = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xffE0DEF7).withOpacity(0.4)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFE0DEF7).withOpacity(0.24),
            blurRadius: 4.0,
            offset: const Offset(0.0, 4.0),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              style: const TextStyle(
                fontSize: 14,
                color: AppTheme.disabledTextColor,
              ),
              children: [
                const TextSpan(text: 'Q '),
                TextSpan(
                  text: '$currentQuestionNumber/',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(text: '$numberOfQuestions'),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: isRtl ? Alignment.centerRight : Alignment.centerLeft,
            child: Text(
              title,
              textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: isRtl ? 'Almarai' : null,
                height: isRtl ? 1.5 : null,
                letterSpacing: isRtl ? 0 : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
