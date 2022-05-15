import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lost_app/data/local/cash_helper.dart';
import 'package:lost_app/presentations/on_boarding/on_boarding_cubit/on_boarding_cubit.dart';
import 'package:lost_app/presentations/route/route_constants.dart';
import 'package:lost_app/shared/components/constant.dart';
import 'package:lost_app/shared/components/custom_button.dart';
import 'package:lost_app/shared/components/navigator.dart';
import 'package:lost_app/shared/components/smooth_page_indicator_class.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class OnBoardingScreen extends StatelessWidget {
  final PageController boardingController = PageController();

  @override
  Widget build(BuildContext context) {
    final cubit = OnBoardingCubit.get(context);

    return BlocConsumer<OnBoardingCubit, OnBoardingStates>(
      listener: (context, state) {
        if (cubit.isLastPage) {
          CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
            onBoarding = true;
          });
        } else {
          CacheHelper.removeData(key: 'onBoarding').then((value) {
            onBoarding = false;
          });
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Align(
            child: SizedBox(
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
                            context,
                          ),
                          controller: boardingController,
                          onPageChanged: (index) {
                            if (index == cubit.splash.length - 1) {
                              cubit.changeTextButton(changeText: true);
                              cubit.isLastPage = true;
                            } else {
                              cubit.changeTextButton(changeText: false);
                              cubit.isLastPage = false;
                            }
                          },
                        ),
                      ),
                      CustomButton(
                        onPressed: () {
                          cubit.isLastPage
                              ? navigateTo(context, RouteConstant.loginRoute)
                              : boardingController.nextPage(
                                  duration: const Duration(microseconds: 700),
                                  curve: Curves.easeIn,
                                );
                        },
                        text: cubit.buttonText,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget buildBoardingItem(
  OnBoardingModel model,
  int splashLength,
  PageController controller,
  BuildContext context,
) {
  final Size size = MediaQuery.of(context).size;
  return SingleChildScrollView(
    child: Padding(
      padding:
          const EdgeInsets.only(top: 80.0, right: 20, left: 20, bottom: 20),
      child: Column(
        children: [
          SvgPicture.asset(
            model.image,
            fit: BoxFit.fitWidth,
          ),
          const SizedBox(height: 10),
          SmoothPageIndicatorClass(count: splashLength, controller: controller),
          const SizedBox(height: 30),
          TextClass(
            text: model.title,
            fontSize: size.width >= 500 ? 25 : size.width / 18,
          ),
          const SizedBox(height: 50),
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