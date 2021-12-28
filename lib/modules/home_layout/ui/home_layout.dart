import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lost_app/modules/home_layout/home_layout_cubit/cubit.dart';
import 'package:lost_app/modules/home_layout/home_layout_cubit/states.dart';
import 'package:lost_app/modules/profile/ui/profile.dart';
import 'package:lost_app/modules/route/route_constants.dart';
import 'package:lost_app/shared/components/appbar_widget.dart';
import 'package:lost_app/modules/home/ui/home.dart';
import 'package:lost_app/modules/post/ui/post.dart';
import 'package:lost_app/shared/components/navigator.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class HomeLayoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeLayoutCubit.get(context);
        return Scaffold(
          appBar: cubit.appBar[cubit.indexPage],
          body: cubit.page[cubit.indexPage],

          floatingActionButton: FloatingActionButton(
            backgroundColor: bottomNavBarBlue,
            //Floating action button on Scaffold
            onPressed: () {
              navigateTo(context, RouteConstant.postRoute);
            },
            child: SvgPicture.asset('assets/icons/post.svg', color: white),

            //icon inside button
          ),

          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          //floating action button position to center

          bottomNavigationBar: BottomAppBar(
            //bottom navigation bar on scaffold
            color: white,
            shape: CircularNotchedRectangle(),
            elevation: 10.0,
            //shape of notch
            notchMargin: 10,
            child: Container(
              height: 67,
              child: Row(
                //children inside bottom appbar
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Column(
                          children: [
                            IconButton(
                              iconSize: 10,
                              highlightColor: black,
                              icon: SvgPicture.asset('assets/icons/account.svg',
                                  color: cubit.bottomNavBarAccColor),
                              onPressed: null,
                            ),
                            TextClass(
                              text: 'حسابي',
                              textColor: cubit.bottomNavBarAccColor,
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                          ],
                        ),
                      ),
                      onTap: () => cubit.changeBottomNavBarIndexAndColor(),
                    ),
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  Expanded(
                    child: FlatButton(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          children: [
                            IconButton(
                              iconSize: 10,
                              icon: SvgPicture.asset('assets/icons/home.svg',
                                  color: cubit.bottomNavBarHomeColor),
                              onPressed: null,
                            ),
                            TextClass(
                              text: 'الرئيسيه',
                              textColor: cubit.bottomNavBarHomeColor,
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                          ],
                        ),
                      ),
                      onPressed: ()=> cubit.changeBottomNavBarIndexAndColor(),


                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
