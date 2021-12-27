import 'package:flutter/material.dart';
import 'package:lost_app/modules/profile/ui/profile.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class EditProfile extends StatelessWidget {

  Image? image;
  String? name;
  String? number;
  String? email;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_sharp, color: black),
        ),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: white,
        elevation: 0,
      ),
      body: Container(
        color: white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: black,
                    width: 1.3,
                  ),
                  shape: BoxShape.circle,
                ),
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/IMG20201116145812.jpg',
                      height: 180,
                      width: 180,
                      fit: BoxFit.cover,
                      //color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              TextClass(
                text: 'منصور طارق منصور محمد منصور',
                fontSize: size.width >= 500 ? 30 : size.width / 13,
                overflow: TextOverflow.clip,
              ),
              SizedBox(height: 20),
              AccountTextFormField(
                text: '01149589134',
                icon: Icons.phone,
              ),
              SizedBox(height: 3),
              AccountTextFormField(
                text: 'mansourtarek100@gmail.com',
                icon: Icons.email,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
