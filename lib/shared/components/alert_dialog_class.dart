import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lost_app/shared/components/divider_class.dart';

class AlertDialogClass extends StatelessWidget {
  final Widget? content;
  final Color backgroundColor;
  final double height;
  final Widget widget;
  Widget? bottomWidget;
  final bool isDoneIcon;
  final double width;

  AlertDialogClass({
    this.content,
    this.backgroundColor = Colors.transparent,
    this.width = 300,
    required this.height,
    this.bottomWidget,
    required this.widget,
    this.isDoneIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: backgroundColor,
      insetPadding: const EdgeInsets.symmetric(vertical: 50),
      content: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        child: Column(
          children: [
            const SizedBox(height: 25),
            widget,
            if (isDoneIcon)
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: SvgPicture.asset('assets/icons/done.svg'),
              ),
            if (isDoneIcon)
              const DividerClass(
                color: Color.fromRGBO(200, 218, 245, 1),
                thickness: 2.0,
              ),
            if (bottomWidget != null)
              Expanded(
                child: SizedBox(width: double.infinity, child: bottomWidget),
              )
          ],
        ),
      ),
    );
  }
}
