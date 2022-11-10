import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SendMessageBox extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final int? messageLength;
  final bool? hasLength;
  final String? hintText;

  const SendMessageBox({
    this.controller,
    this.focusNode,
    this.messageLength,
    this.hasLength = false,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9),
        border: Border.all(
          color: const Color(0xFFE0E0E0),
        ),
      ),
      child: TextField(
        focusNode: focusNode,
        controller: controller,
        inputFormatters: [
          LengthLimitingTextInputFormatter(
            hasLength == true ? messageLength : null,
          ), // Number of letters
        ],
        maxLines: null,
        // to make multi lines
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0xFFC4C4C4),
            fontSize: 15,
          ),
          //focusedBorder: InputBorder.none,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
