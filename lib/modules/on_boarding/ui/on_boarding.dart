import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lost_app/modules/login/ui/login.dart';
import 'package:lost_app/modules/on_boarding/on_boarding_cubit/cubit.dart';
import 'package:lost_app/modules/on_boarding/on_boarding_cubit/states.dart';
import 'package:lost_app/shared/components/raised_button_class.dart';
import 'package:lost_app/shared/components/component.dart';
import 'package:lost_app/shared/components/smooth_page_indicator_class.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class OnBoardingScreen extends StatelessWidget {
  final PageController boardingController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnBoardingCubit, OnBoardingStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = OnBoardingCubit.get(context);
        return Scaffold(
            body: Align(
          alignment: Alignment.center,
          child: Container(
            width: 500,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    Flexible(
                      child: PageView.builder(
                        reverse: true,
                        itemCount: cubit.splash.length,
                        itemBuilder: (context, index) => buildBoardingItem(
                            cubit.splash[index],
                            cubit.splash.length,
                            boardingController,
                            context),
                        controller: boardingController,
                        onPageChanged: (index) {
                          if (index == cubit.splash.length - 1) {
                            cubit.changeTextButton(true);
                            cubit.isLastPage = true;
                          } else {
                            cubit.changeTextButton(false);
                            cubit.isLastPage = false;
                          }
                        },
                      ),
                    ),
                    RaisedButtonClass(
                        onPressed: () {
                          cubit.isLastPage
                              ? navigateTo(context, LoginScreen())
                              : boardingController.nextPage(
                                  duration: Duration(microseconds: 700),
                                  curve: Curves.easeIn);
                        },
                        text: cubit.buttonText,
                        textColor: white),
                  ],
                ),
              ),
            ),
          ),
        ));
      },
    );
  }
}

Widget buildBoardingItem(model, splashLength, controller, context) {
  Size size = MediaQuery.of(context).size;
  return SingleChildScrollView(
    child: Padding(
      padding:
          const EdgeInsets.only(top: 80.0, right: 20, left: 20, bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: SvgPicture.asset(
              model.image,
              fit: BoxFit.fitWidth,
            ),
          ),
          SizedBox(height: 10),
          SmoothPageIndicatorClass(count: splashLength, controller: controller),
          SizedBox(height: 30),
          TextClass(
            text: model.title,
            fontSize: size.width >= 500 ? 25 : size.width / 18,
            fontWeight: FontWeight.normal,
          ),
          SizedBox(height: 50),
          TextClass(
            text: model.body,
            fontSize: size.width >= 500 ? 18 : size.width / 22,
            textColor: lightGrey,
          ),
        ],
      ),
    ),
  );
}
