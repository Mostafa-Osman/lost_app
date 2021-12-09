import 'package:flutter/material.dart';

class AlertDialogClass extends StatelessWidget {
  Widget? content;
  late Color backgroundColor;

  AlertDialogClass({this.content, this.backgroundColor = Colors.transparent});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: backgroundColor,
      contentPadding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      insetPadding: EdgeInsets.symmetric(vertical: 50),
      content: content,
    );
  }
}
