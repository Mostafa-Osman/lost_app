import 'package:flutter/material.dart';
import 'package:lost_app/post/create_post/widgets/card_type_post.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class PostTypeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextClass(
          text: 'اختر نوع المنشور',
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_sharp, color: black),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: white,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              color: white,
              child: Column(
                children: const [
                  CardPostPage(
                    image: 'assets/images/welcome_1.svg',
                    text: 'ابحث عن احد المفقودين',
                    size: 250,
                    optionText: 'مكان الفقدان',
                  ),
                  SizedBox(height: 20),
                  CardPostPage(
                    image: 'assets/images/lost_post.svg',
                    text: 'وجدت احد المفقودين',
                    size: 200,
                    optionText: 'مكان العثور',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
