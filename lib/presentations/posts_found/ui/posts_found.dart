import 'package:flutter/material.dart';
import 'package:lost_app/presentations/route/route_constants.dart';
import 'package:lost_app/shared/components/alert_dialog_class.dart';
import 'package:lost_app/shared/components/navigator.dart';
import 'package:lost_app/shared/components/post_card.dart';
import 'package:lost_app/shared/components/text_button_class.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class PostsFoundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
          backgroundColor: white,
          elevation: 0,
          leading: IconButton(
              onPressed: () =>
                  navigatorAndFinish(context, RouteConstant.homeLayoutRoute),
              icon: const Icon(Icons.arrow_back_ios_sharp, color: black),),),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const TextClass(text: 'تهانينا', fontSize: 30),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 10.0, left: 10.0, top: 20),
                  child: TextClass(
                    text:
                        'لقد عثرنا علي(بعض/احد) المنشورات تتطابق مع البيانات التي ادحلتها',
                    textColor: lightGrey,
                    fontSize: 22,
                  ),
                ),
                TextButtonClass(
                    text: 'اليس كذالك ؟',
                    textColor: mainColor,
                    fontSize: 18,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialogClass(
                            height: 200,
                            widget: Column(
                              children: [
                                const  Padding(
                                  padding:  EdgeInsets.only(
                                      top: 20.0,
                                      right: 20.0,
                                      left: 20.0,
                                      bottom: 30,),
                                  child: TextClass(
                                      text:
                                          'سنقوم بحفظ البيانات المدخله في قاعدة البيانات وانشاء منشور',
                                      fontSize: 20,),
                                ),
                                Container(
                                  height: 2,
                                  color: const Color.fromRGBO(200, 218, 245, 1),
                                ),
                              ],
                            ),
                            bottomWidget: Row(
                              children: [
                                Expanded(
                                    child: TextButtonClass(
                                  text: 'تعديل البيانات',
                                  fontSize: 18,
                                  textColor: lightGrey,
                                  onPressed: () => navigateWithArgument(context,
                                      RouteConstant.addPersonDataRoute,'مكان الفقدان',),
                                ),),
                                Container(
                                  width: 2,
                                  color: const Color.fromRGBO(200, 218, 245, 1),
                                ),
                                Expanded(
                                  child: TextButtonClass(
                                    text: 'نشر',
                                    fontSize: 18,
                                    textColor: mainColor,
                                    onPressed: () {},
                                  ),
                                )
                              ],
                            ),
                            isDoneIcon: false,),
                      );
                    },),
               const SizedBox(height: 30),
                PostCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
