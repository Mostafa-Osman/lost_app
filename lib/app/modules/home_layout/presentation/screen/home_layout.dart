
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lost_app/app/modules/home_layout/bloc/home_cubit.dart';
import 'package:lost_app/app/modules/home_layout/presentation/widgets/home_layout_bottom_nav_bar.dart';
import 'package:lost_app/app/router/route_names.dart';

import 'package:lost_app/shared/components/navigator.dart';
import 'package:lost_app/shared/styles/color.dart';

class HomeLayoutScreen extends StatefulWidget {
  @override
  State<HomeLayoutScreen> createState() => _HomeLayoutScreenState();
}

class _HomeLayoutScreenState extends State<HomeLayoutScreen> {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    // AuthenticationWebService().updateFcmToken(NotificationsService().pushToken);
    return BlocConsumer<HomeLayoutCubit, BottomNavBarState>(
      listener: (context, state) {},
      builder: (context, state) {
        final homeCubit = BlocProvider.of<HomeLayoutCubit>(context);
        return NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            if (scrollNotification is UserScrollNotification) {
              if (scrollNotification.direction == ScrollDirection.forward) {
                homeCubit.scrollDirection(scroll: false);
              } else if (scrollNotification.direction ==
                      ScrollDirection.reverse &&
                  scrollNotification.metrics.pixels >= 0) {
                homeCubit.scrollDirection(scroll: true);
              }
            }
            return false;
          },
          child: SafeArea(
            child: Scaffold(
              body: Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                color: Colors.white,
                child: Stack(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: homeCubit.page[homeCubit.indexPage],
                    ),
                    Visibility(
                      visible: !homeCubit.scrollDown,
                      child: Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 70,
                          color: Colors.white,
                          child: homeCubit.appBar[homeCubit.indexPage],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: !homeCubit.scrollDown,
                      child: Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: HomeLayoutBottomNavBar(),
                      ),
                    ),
                  ],
                ),
              ),
              floatingActionButton: homeCubit.scrollDown
                  ? const SizedBox()
                  : Padding(
                      padding: const EdgeInsets.only(bottom: 25.0),
                      child: FloatingActionButton(
                        backgroundColor: bottomNavBarBlue,
                        //Floating action button on Scaffold
                        onPressed: () {
                          navigateTo(context, RouteConstant.postType);
                        },
                        child: SvgPicture.asset(
                          'assets/icons/post.svg',
                          color: white,
                        ),
                        //icon inside button
                      ),
                    ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
            ),
          ),
        );
      },
    );
  }
}
