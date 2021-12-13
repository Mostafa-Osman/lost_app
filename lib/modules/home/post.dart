import 'package:flutter/material.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class PostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextClass(
          text: 'اختر نوع المنشور',
        ),
        iconTheme: IconThemeData(
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
                children: [
                  CardPostPage(image: 'assets/images/founded_post.png', text: 'ابحث عن احد المفقودين'),
                  SizedBox(
                    height: 20,
                  ),
                  CardPostPage(image: 'assets/images/lost_post.png', text: 'وجدت احد المفقودين'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class CardPostPage extends StatelessWidget {
  final String image;
  final String text;

  CardPostPage({required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 310,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Card(
        elevation: 6,
        child: FlatButton(
          onPressed: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  image,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: TextClass(text: text),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
