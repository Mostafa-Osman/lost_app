import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SmoothPageIndicatorClass extends StatelessWidget {
   final int  count;
   final PageController controller;

  const SmoothPageIndicatorClass({required this.count,required this.controller});

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      count: count,
      textDirection: TextDirection.ltr,
      controller: controller,
      effect: const WormEffect(
        dotWidth: 20,
        activeDotColor: Color.fromRGBO(42, 185, 237, 1),
          dotColor:Color.fromRGBO(45, 199, 255, 0.2),

      ),
    );
  }
}
