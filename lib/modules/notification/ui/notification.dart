import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
          backgroundColor: white,
          elevation: 0,
          centerTitle: true,
          title: const TextClass(text: 'الاشعارات', fontSize: 25),
          leading: IconButton(
              onPressed: ()=>Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios_sharp, color: black),),),
      body:Container(
          alignment: Alignment.center,
          width: 500,
          child: ListView.builder(
            itemBuilder: (ctx, index) {
              return NotificationItem(index: index);
            },
            itemCount: 10,
          ),
        ),

    );
  }
}


class NotificationItem extends StatelessWidget {
  final int index;

  const NotificationItem({required this.index});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height / 5.9;
    return GestureDetector(
      onTap: () {
        log(index.toString());
      },
      child: Container(
        margin: const EdgeInsets.only(top: 20, right: 10, left: 10),
        width: MediaQuery.of(context).size.width,
        height: height,
        decoration: BoxDecoration(
          color: lightBlue,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, right: 10),
                  child: ClipOval(
                    child: SvgPicture.asset('assets/images/lost_person_image.svg',
                        height: 40,
                        width: 40,
                        fit: BoxFit.cover,),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.9,
                  height: MediaQuery.of(context).size.height / 6.3,
                  padding: const EdgeInsets.only(top: 30, right: 5),
                  child: TextClass(
                    fontSize: height * 0.1,
                    textAlign: TextAlign.start,
                    text:
                    'قام احمد محمد بنشر منشور يفيد بانه قد عثر علي شخص يشبه احد الاشخاص الذين قمت بالابلاغ عن فقدانهم',
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 90,
                      height: 20,
                      child: TextClass(
                          text: 'منذ ${index * 2} دقائق',
                          fontSize: height * 0.1,
                          textColor: lightGrey,),
                    ),
                    SizedBox(
                      width: 90,
                      height: MediaQuery.of(context).size.height / 10.1,

                      child:SvgPicture.asset('assets/images/lost_person_image.svg',
                          width: 90,
                          fit: BoxFit.fill,),

                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
