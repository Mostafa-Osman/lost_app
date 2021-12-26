import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lost_app/modules/notification/ui/notification.dart';
import 'package:lost_app/shared/components/component.dart';
import 'package:lost_app/shared/components/divider_class.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Container(
          color: white,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15.0,bottom: 10),
                  child: TextClass(text: 'النظام', fontSize: 20),
                ),
                ListTile(
                  onTap: ()=>navigateTo(context, NotificationScreen()),
                  title:TextClass(
                          text: 'الاشعارات',
                          textAlign: TextAlign.start,
                          fontSize: 20,
                          textColor: lightGrey),
                  trailing: Icon(Icons.arrow_back_ios_new_outlined),
                ),
                ListTile(
                  onTap: () {},
                  title:TextClass(
                          text: 'اللغه',textAlign: TextAlign.start, fontSize: 20, textColor: lightGrey),
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
                      padding: const EdgeInsets.only(left: 10.0),
                      child: FlutterSwitch(
                        width: 50,
                        height: 30,
                        value: isDark,
                        inactiveColor: HexColor('##E2E6ED'),
                        activeColor: mainColor,
                        onToggle: (val) {
                          setState(() {
                            isDark = val;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                DividerClass(color: HexColor('#D8D8D8'), thickness: 0.8),
                Padding(
                  padding: const EdgeInsets.only(top: 5,right: 15.0,bottom: 5),
                  child: TextClass(
                    text: 'الحساب',
                    fontSize: 25,
                  ),
                ),
                ListTile(
                  onTap: () {},
                  title:  TextClass(
                          text: 'تسجيل خروج',    textAlign: TextAlign.start, fontSize: 20, textColor: red),
                  trailing: Icon(Icons.arrow_back_ios_new_outlined, color: red),
                ),
              ],
            ),
          )),
    );
  }
}
