import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lost_app/modules/notification/ui/notification.dart';
import 'package:lost_app/modules/route/route_constants.dart';
import 'package:lost_app/modules/route/route_constants.dart';
import 'package:lost_app/modules/setting/setting_cubit/cubit.dart';
import 'package:lost_app/modules/setting/setting_cubit/states.dart';
import 'package:lost_app/shared/components/navigator.dart';
import 'package:lost_app/shared/components/divider_class.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingCubit, SettingStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SettingCubit.get(context);
        return Scaffold(
            backgroundColor: white,
            appBar: AppBar(
              backgroundColor: white,
              elevation: 0,
              centerTitle: true,
              iconTheme: IconThemeData(
                color: Colors.black, //change your color here
              ),
              leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back_ios_sharp, color: black)),
              title: TextClass(text: 'الاعدادات', fontSize: 25),
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0, bottom: 10),
                    child: TextClass(text: 'النظام', fontSize: 20),
                  ),
                  ListTile(
                    onTap: () => navigateTo(context, RouteConstant.notificationRote),
                    title: TextClass(
                        text: 'الاشعارات',
                        textAlign: TextAlign.start,
                        fontSize: 20,
                        textColor: lightGrey),
                    trailing: Icon(Icons.arrow_back_ios_new_outlined),
                  ),
                  ListTile(
                    onTap: () {},
                    title: TextClass(
                        text: 'اللغه',
                        textAlign: TextAlign.start,
                        fontSize: 20,
                        textColor: lightGrey),
                    trailing: Icon(Icons.arrow_back_ios_new_outlined),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: TextClass(
                            text: 'الوضع الداكن',
                            fontSize: 20,
                            textColor: lightGrey),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, bottom: 10),
                        child: FlutterSwitch(
                          width: 50,
                          height: 30,
                          value: cubit.isDark,
                          inactiveColor: HexColor('##E2E6ED'),
                          activeColor: mainColor,
                          onToggle: (_) {
                            cubit.changeMode();
                          },
                        ),
                      ),
                    ],
                  ),
                  DividerClass(color: HexColor('#D8D8D8'), thickness: 0.8),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 5, right: 15.0, bottom: 5),
                    child: TextClass(
                      text: 'الحساب',
                      fontSize: 25,
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    title: TextClass(
                        text: 'تسجيل خروج',
                        textAlign: TextAlign.start,
                        fontSize: 20,
                        textColor: red),
                    trailing:
                        Icon(Icons.arrow_back_ios_new_outlined, color: red),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
