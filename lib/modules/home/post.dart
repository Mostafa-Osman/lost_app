import 'package:flutter/material.dart';
import 'package:lost_app/shared/components/text_class.dart';

class PostScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextClass(text: 'اختر نوع المنشور',),
      ),
      body: Column( 
        children: [
          Container(
            decoration: BoxDecoration(

            ),
          ),
        ],
      ),
    );
  }
}
