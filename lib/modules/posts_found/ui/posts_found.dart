import 'package:flutter/material.dart';
import 'package:lost_app/modules/home_layout/home_layout.dart';
import 'package:lost_app/shared/components/PostCard.dart';
import 'package:lost_app/shared/components/alert_dialog_class.dart';
import 'package:lost_app/shared/components/component.dart';
import 'package:lost_app/shared/components/text_button_class.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class PostsFoundScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: white,
          elevation: 0,
          leading: IconButton(
              onPressed: () => navigatorAndFinish(context, HomeLayout()),
              icon: Icon(Icons.arrow_back_ios_sharp, color: black))),
      body: SingleChildScrollView(
        child: Container(
          color: white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextClass(text: 'تهانينا', fontSize: 25),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                child: TextClass(
                  text:
                      'لقد عثرنا علي(بعض/احد) المنشورات تتطابق مع البيانات التي ادحلتها',
                  textColor: lightGrey,
                ),
              ),
              TextButtonClass(
                  text: 'اليس كذالك ؟',
                  textColor: mainColor,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialogClass(
                          height: 200,
                          widget: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0,right: 20.0,left: 20.0,bottom: 30),
                                child: TextClass(
                                    text:
                                        'سنقوم بحفظ البيانات المدخله في قاعدة البيانات وانشاء منشور',
                                    fontSize: 20),
                              ),
                              Container(
                                height: 2,
                                color: Color.fromRGBO(200, 218, 245, 1),
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
                                onPressed: () {},
                              )),
                              Container(
                                width: 2,
                                color: Color.fromRGBO(200, 218, 245, 1),
                              ),
                              Expanded(
                                  child: TextButtonClass(
                                text: 'نشر',
                                fontSize: 18,
                                textColor: mainColor,
                                onPressed: () {},
                              ))
                            ],
                          ),
                          isDoneIcon: false
                      ),
                    );
                  }),
              SizedBox(height: 30),
              PostCard(),
            ],
          ),
        ),
      ),
    );
  }
}
