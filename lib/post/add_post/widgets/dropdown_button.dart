import 'package:flutter/material.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class DropdownButtonClass extends StatelessWidget {
  final GlobalKey<FormState> keyForm ;
  final String? hintText;
  final FormFieldValidator? validator;
  final List<DropdownMenuItem<Object>> items;
  final String? selectedValue;
  final ValueChanged? onChange;

  const DropdownButtonClass(
      {required this.keyForm,
      this.hintText='',
      this.validator,
        this.onChange,
      required this.items,
      this.selectedValue,});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      padding: const EdgeInsets.only(right: 10.0, left: 10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black54),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Form(
        key: keyForm,
        child: DropdownButtonFormField(

            hint: TextClass(text: hintText!, textColor: lightGrey),
            icon: const Icon(Icons.keyboard_arrow_down_outlined, size: 30),
            validator: validator,
            dropdownColor: Colors.grey[200],
            value: selectedValue,
            onChanged: onChange,
            items: items,),
      ),
    );
  }
}
