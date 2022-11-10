import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lost_app/app/common/data/local/pref/user_pref.dart';
import 'package:lost_app/app/modules/authentication/data/web_services/authentication_web_service.dart';
import 'package:lost_app/app/modules/home_layout/bloc/home_cubit.dart';
import 'package:lost_app/app/router/route_names.dart';
import 'package:lost_app/shared/components/divider_class.dart';
import 'package:lost_app/shared/components/navigator.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          backgroundColor: white,
          elevation: 0,
          centerTitle: true,
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_sharp, color: black),
          ),
          title: GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                RouteConstant.changePort,
              );
            },
            child: const TextClass(text: 'الاعدادات', fontSize: 25),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const   Padding(
              //   padding:  EdgeInsets.only(right: 15.0, bottom: 10),
              //   child: TextClass(text: 'النظام', fontSize: 20),
              // ),
              ListTile(
                onTap: () =>
                    navigateTo(context, RouteConstant.notificationRoute),
                title: TextClass(
                  text: 'الاشعارات',
                  textAlign: TextAlign.start,
                  fontSize: 20,
                  textColor: lightGrey,
                ),
                trailing: const Icon(Icons.arrow_back_ios_new_outlined),
              ),
              ListTile(
                onTap: () => navigateTo(context, RouteConstant.savedPostsRoute),
                title: TextClass(
                  text: 'المحفوظات',
                  textAlign: TextAlign.start,
                  fontSize: 20,
                  textColor: lightGrey,
                ),
                trailing: const Icon(Icons.arrow_back_ios_new_outlined),
              ),
              // ListTile(
              //   onTap: () {},
              //   title: TextClass(
              //       text: 'اللغه',
              //       textAlign: TextAlign.start,
              //       fontSize: 20,
              //       textColor: lightGrey,),
              //   trailing: const Icon(Icons.arrow_back_ios_new_outlined),
              // ),
              const SizedBox(height: 10),
              //   Row(
              //     children: [
              //       Padding(
              //         padding: const EdgeInsets.only(right: 15.0),
              //         child: TextClass(
              //             text: 'الوضع الداكن',
              //             fontSize: 20,
              //             textColor: lightGrey,),
              //       ),
              //
              //     const Spacer(),
              //     // Padding(
              //     //   padding: const EdgeInsets.only(left: 10.0, bottom: 10),
              //     //   child: FlutterSwitch(
              //     //     width: 50,
              //     //     height: 30,
              //     //     value: cubit.isDark,
              //     //     inactiveColor: HexColor('##E2E6ED'),
              //     //     activeColor: mainColor,
              //     //     onToggle: (_) {
              //     //       cubit.changeMode();
              //     //     },
              //     //   ),
              //     // ),
              //   ],
              // ),
              DividerClass(color: HexColor('#D8D8D8'), thickness: 0.8),
              const Padding(
                padding: EdgeInsets.only(top: 5, right: 15.0, bottom: 5),
                child: TextClass(
                  text: 'الحساب',
                  fontSize: 25,
                ),
              ),
              ListTile(
                onTap: () async {
                  BlocProvider.of<HomeLayoutCubit>(context)
                      .changeBottomNavBarIndexAndColor(0);
                  UserPrefs().deleteUserToken();
                  await AuthenticationWebService().updateFcmToken('');
                  navigateTo(context, RouteConstant.loginRoute);
                },
                title: const TextClass(
                  text: 'تسجيل خروج',
                  textAlign: TextAlign.start,
                  fontSize: 20,
                  textColor: red,
                ),
                trailing:
                    const Icon(Icons.arrow_back_ios_new_outlined, color: red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
