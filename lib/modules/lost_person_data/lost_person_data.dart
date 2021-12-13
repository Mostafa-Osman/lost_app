import 'package:flutter/material.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class LostPersonData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: white,
          elevation: 0,
          centerTitle: true,
          title: TextClass(text: 'بيانات المفقود', fontSize: 25),
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back_ios_sharp, color: black))),
      body: Container(
        color: white,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(

                    child: ClipOval(
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.person, color: mainColor),
                      ),
                      // Image.asset(
                      //   'assets/images/lost_person_image.png',
                      //   height: 180,
                      //   width: 180,
                      //   fit: BoxFit.cover,
                      //   //color: Colors.white,
                      // ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
