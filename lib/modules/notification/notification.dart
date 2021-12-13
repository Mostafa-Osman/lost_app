import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lost_app/modules/notification/notification_item.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: white,
          elevation: 0,
          centerTitle: true,
          title: TextClass(text: 'الاشعارات', fontSize: 25),
          leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back_ios_sharp, color: black))),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return NotificationItem( index: index);
        },
        itemCount: 10,
      ),
    );
  }
}
