import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SmoothPageIndicatorClass extends StatelessWidget {
  late final count;
  dynamic controller;

  SmoothPageIndicatorClass({required this.count, this.controller});

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      count: count,
      textDirection: TextDirection.ltr,
      controller: controller,
      effect: ExpandingDotsEffect(
        activeDotColor: const Color.fromRGBO(42, 185, 237, 1),
      ),
    );
  }
}
