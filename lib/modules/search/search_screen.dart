import 'package:flutter/material.dart';
import 'package:lost_app/shared/components/text_form_field_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class SearchScreen extends StatelessWidget {
  TextEditingController homeAppBarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_sharp, color: black),
        ),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: Container(
          decoration: BoxDecoration(
            color: white,
            //borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ConstrainedBox(
              constraints: BoxConstraints.tightFor(height: 40),
              child: TextFormFieldClass(
                controller: homeAppBarController,
                roundedRectangleBorder: 6,
                textHint: 'البحث...',

              ),
            ),
          )),
    );
  }
}
