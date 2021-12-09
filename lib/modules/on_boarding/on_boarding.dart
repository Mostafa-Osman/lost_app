import 'package:flutter/material.dart';
import 'package:lost_app/modules/login/login.dart';
import 'package:lost_app/shared/components/raised_button_class.dart';
import 'package:lost_app/shared/components/component.dart';
import 'package:lost_app/shared/components/smooth_page_indicator_class.dart';
import 'package:lost_app/shared/components/text_class.dart';

class OnBoardingModel {
  final String image;
  final String title;
  final String body;

  OnBoardingModel(
      {required this.image, required this.title, required this.body});
}

class OnBoardingScreen extends StatefulWidget {

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardingController = PageController();
  String changeButtonText = 'التالي';
  bool isLogin = false;

  List<OnBoardingModel> splash = [
    OnBoardingModel(
        image: 'assets/images/welcome_1.png',
        title: 'هل تبحث عن احد المفقودين ',
        body:
            "اذا كنت تبحث عن احد الأشخاص المفقودين يمكنك ارفاق صوره لهذا الشخص و سوف نساعدك في ايجاده"),
    OnBoardingModel(
        image: 'assets/images/welcome_2.png',
        title: 'ام وجدت احد المفقودين ',
        body:
            "اما اذا كنت قد وجدت شخصا مفقوداو لا تستطيع الوصول الى ذويه فيمكنك ارفاق صورة له وسوف نساعدك في الوصول الى اقربائه"),
    OnBoardingModel(
        image: 'assets/images/welcome_3.png',
        title: 'كل ما عليك هو ارفاق صورة وسنقوم بالبحث بدلا عنك ',
        body:
            "نقوم بتحليل الصورة عن طريق احدى تقنيات الذكاء الاصطناعي ومن ثم البحث في قاعدة البيانات التي تحتوي على العديد من الصور لاشخاص مفقودين  "),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Expanded(
                  child: PageView.builder(
                reverse: true,
                itemCount: splash.length,
                itemBuilder: (context, index) => buildBoardingItem(
                    splash[index], splash.length, boardingController),
                controller: boardingController,
                onPageChanged: (index) {
                  (index == splash.length - 1)
                      ? setState(() {
                          changeButtonText = 'هيا نبدأ';
                          isLogin = true;
                        })
                      : setState(() {
                          changeButtonText = 'التالي';
                          isLogin = false;
                        });
                },
              )),
              RaisedButtonClass(
                  onPressed: () {
                    print(isLogin);
                    isLogin
                        ? navigateTo(context, LoginScreen())
                        : boardingController.nextPage(
                            duration: Duration(microseconds: 700),
                            curve: Curves.easeIn);
                  },
                  text: changeButtonText,
                  textColor: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildBoardingItem(OnBoardingModel model, splashLength, controller) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            width: 370,
            height: 270,
            child: Image(image: AssetImage(model.image))),
        SizedBox(height: 10),
        SmoothPageIndicatorClass(count: splashLength, controller: controller),
        SizedBox(height: 30),
        TextClass(
          text: model.title,
          fontSize: 25,
          fontWeight: FontWeight.normal,
        ),
        SizedBox(height: 50),
        TextClass(text: model.body, textColor: Colors.black38),
      ],
    );
