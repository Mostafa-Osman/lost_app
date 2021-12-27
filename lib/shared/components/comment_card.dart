import 'package:flutter/material.dart';
import 'package:lost_app/shared/components/text_button_class.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class CommentCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      child: Container(
        decoration: BoxDecoration(
          color: lightBlue,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          child: Column(
            children: [
              Row(
                children: [
                  ClipOval(
                    child: Image.asset(
                      'assets/images/IMG20201116145812.jpg',
                      width: size.width >= 500? 40 :size.width/10,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextClass(
                            text: 'محمد احمد',
                            textAlign: TextAlign.start,
                          ),
                          TextClass(
                            text: 'منذ 5 دقائق',
                            fontSize: 12,
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_vert,
                      size: size.width >= 500? 30 : size.width/18,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  SizedBox(width: 50),
                  Expanded(
                    child: TextClass(
                      text:
                          'قام احمد محمد بنشر منشور يفيد بانه قد عثر علي شخص يشبه احد الاشخاص الذين قمت بالابلاغ عن فقدانهم',
                      maxLines: 3,
                      fontSize: size.width >= 500? 20 : size.width/24,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextButtonClass(
                    text: 'الرد',
                    onPressed: () {},
                    fontSize: 12,
                  ),
                  TextButtonClass(
                    text: 'الردود (3)',
                    onPressed: () {},
                    fontSize: 12,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
