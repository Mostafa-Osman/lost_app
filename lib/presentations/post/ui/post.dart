import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lost_app/presentations/route/route_constants.dart';
import 'package:lost_app/shared/components/navigator.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class PostScreen extends StatelessWidget {
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

class CardPostPage extends StatelessWidget {
  final String image;
  final String text;
  final double? size;
  final String? optionText;

  const CardPostPage(
      {required this.image, required this.text, this.optionText, this.size,});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 310,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Card(
        elevation: 6,
        child: InkWell(
          onTap: () => navigateWithArgument(
              context, RouteConstant.addPersonDataRoute, optionText,),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(
                  image,
                  fit: BoxFit.fitWidth,
                  width: size,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                child: TextClass(text: text),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
