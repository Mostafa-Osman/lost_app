import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lost_app/presentations/home_layout/home_layout_cubit/home_cubit.dart';
import 'package:lost_app/presentations/route/route_constants.dart';
import 'package:lost_app/shared/components/navigator.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/styles/color.dart';
class HomeLayoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final homeCubit = BlocProvider.of<HomeLayoutCubit>(context);
        return Scaffold(
          appBar: homeCubit.appBar[homeCubit.indexPage],
          body: homeCubit.page[homeCubit.indexPage],
          floatingActionButton: FloatingActionButton(
            backgroundColor: bottomNavBarBlue,
            //Floating action button on Scaffold
            onPressed: () {
              navigateTo(context, RouteConstant.postType);
            },
            child: SvgPicture.asset('assets/icons/create_post.svg', color: white),

            //icon inside button
          ),

          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          //floating action button position to center

          bottomNavigationBar: BottomAppBar(
            //bottom navigation bar on scaffold
            color: white,
            shape: const CircularNotchedRectangle(),
            elevation: 10.0,
            //shape of notch
            notchMargin: 10,
            child: SizedBox(
              height: 82,
              child: Row(
                //children inside bottom appbar
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
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
                                  color: homeCubit.bottomNavBarAccColor,),
                              onPressed: null,
                            ),
                            TextClass(
                              text: 'حسابي',
                              textColor: homeCubit.bottomNavBarAccColor,
                              fontSize: 15,
                            ),
                          ],
                        ),
                      ),
                      // onTap: () => homeCubit.changeBottomNavBarIndexAndColor(0),
                    ),
                  ),
                  const SizedBox(
                    width: 80,
                  ),
                  Expanded(
                    child: TextButton(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          children: [
                            IconButton(
                              iconSize: 10,
                              icon: SvgPicture.asset('assets/icons/home.svg',
                                  color: homeCubit.bottomNavBarHomeColor,),
                              onPressed: null,
                            ),
                            TextClass(
                              text: 'الرئيسيه',
                              textColor: homeCubit.bottomNavBarHomeColor,
                              fontSize: 15,
                            ),
                          ],
                        ),
                      ),
                      onPressed: ()=> homeCubit.changeBottomNavBarIndexAndColor(0),


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
