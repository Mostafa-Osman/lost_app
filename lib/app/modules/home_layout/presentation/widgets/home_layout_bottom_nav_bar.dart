import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lost_app/app/modules/home_layout/bloc/home_cubit.dart';
import 'package:lost_app/shared/styles/color.dart';

class HomeLayoutBottomNavBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeLayoutCubit, BottomNavBarState>(
      builder: (context, state) {
        final homeCubit = BlocProvider.of<HomeLayoutCubit>(context);
        return BottomAppBar(
          //bottom navigation bar on scaffold
          color: white,
          shape: const CircularNotchedRectangle(),
          elevation: 10.0,
          //shape of notch
          notchMargin: 30,
          child: SizedBox(
            height: 65,
            child: Row(
              //children inside bottom appbar
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25.0,),
                    child: GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 15.0,
                          top: 5,
                        ),
                        child: Column(
                          children: [
                            IconButton(
                              iconSize: 10,
                              highlightColor: black,
                              icon: SvgPicture.asset(
                                'assets/icons/account.svg',
                                color: homeCubit
                                    .bottomNavBarAccColor,
                              ),
                              onPressed: null,
                            ),
                            // TextClass(
                            //   text: 'حسابي',
                            //   textColor: homeCubit.bottomNavBarAccColor,
                            //   fontSize: 15,
                            // ),
                          ],
                        ),
                      ),
                      onTap: () =>
                          homeCubit
                              .changeBottomNavBarIndexAndColor(0),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 80,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 25.0),
                    child: GestureDetector(
                      onTap: () =>
                          homeCubit
                              .changeBottomNavBarIndexAndColor(1),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, top: 5,),
                        child: Column(
                          children: [
                            IconButton(
                              iconSize: 10,
                              icon: SvgPicture.asset(
                                'assets/icons/home.svg',
                                color: homeCubit
                                    .bottomNavBarHomeColor,
                              ),
                              onPressed: null,
                            ),
                            // TextClass(
                            //   text: 'الرئيسيه',
                            //   textColor: homeCubit.bottomNavBarHomeColor,
                            //   fontSize: 15,
                            // ),
                          ],
                        ),
                      ),

                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
