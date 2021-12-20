import 'package:flutter/material.dart';
import 'package:lost_app/modules/home_layout/home_layout.dart';
import 'package:lost_app/shared/components/CardPost.dart';
import 'package:lost_app/shared/components/component.dart';
import 'package:lost_app/shared/components/text_button_class.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class PostsFoundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: white,
          elevation: 0,
          leading: IconButton(
              onPressed: () => navigatorAndFinish(context, HomeLayout()),
              icon: Icon(Icons.arrow_back_ios_sharp, color: black))),
      body: SingleChildScrollView(
        child: Container(
          color: white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextClass(text: 'تهانينا', fontSize: 25),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                child: TextClass(
                  text:
                      'لقد عثرنا علي(بعض/احد) المنشورات تتطابق مع البيانات التي ادحلتها',
                  textColor: lightGrey,
                ),
              ),
              TextButtonClass(
                  text: 'اليس كذالك ؟', textColor: mainColor, onPressed: () {}),
              SizedBox(height: 30),
              CardPost(),
            ],
          ),
        ),
      ),
    );
  }
}
