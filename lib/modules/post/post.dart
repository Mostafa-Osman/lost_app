import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lost_app/modules/add_person_data/ui/add_person_data.dart';
import 'package:lost_app/modules/posts_found/ui/posts_found.dart';
import 'package:lost_app/shared/components/component.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class PostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextClass(
          text: 'اختر نوع المنشور',
          textAlign: TextAlign.center,
        ),
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
                  CardPostPage(
                    image: 'assets/images/welcome_1.svg',
                    text: 'ابحث عن احد المفقودين',
                    size: 250,
                    page: AddPersonDataScreen(
                      textPost: 'مكان الفقدان',
                    ),
                  ),
                  SizedBox(height: 20),
                  CardPostPage(
                    image: 'assets/images/lost_post.svg',
                    text: 'وجدت احد المفقودين',
                    size: 200,
                    page: AddPersonDataScreen(
                      textPost: 'مكان العثور',
                    ),
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

class CardPostPage extends StatelessWidget {
  final String image;
  final String text;
  double? size;
  Widget? page;

  CardPostPage({required this.image, required this.text, this.page, this.size});

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
        child: InkWell(
          onTap: () {
            navigateTo(context, page);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(
                  image,
                  fit: BoxFit.fitWidth,
                  width: size,
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
