import 'package:flutter/material.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class DropdownButtonClass extends StatelessWidget {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  final hintText;
  final validator;
  final items;
  final selectedValue;

  DropdownButtonClass(
      {required this.key,
      this.hintText,
      this.validator,
      this.items,
      this.selectedValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      padding: EdgeInsets.only(right: 10.0, left: 10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black54),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Form(
        key: key,
        child: DropdownButtonFormField(
            hint: TextClass(text: hintText, textColor: lightGrey),
            icon: Icon(Icons.keyboard_arrow_down_outlined, size: 30),
            validator: validator,
            dropdownColor: Colors.grey[200],
            value: selectedValue,
            onChanged: (value) {},
            items: items),
      ),
    );
  }
}
