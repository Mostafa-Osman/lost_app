import 'package:flutter/material.dart';
import 'package:lost_app/shared/components/text_form_field_class.dart';

class EditCommentScreen extends StatelessWidget {

  EditCommentScreen({required this.commentText});
  final String commentText;
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    textEditingController.text = commentText;
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: TextFormFieldClass(
        controller: textEditingController,
        height: MediaQuery.of(context).size.height,

      ),
    );
  }
}
