import 'package:flutter/material.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class NotificationItem extends StatelessWidget {
  final int index;

  const NotificationItem({required this.index});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 5.9;
    return GestureDetector(
      onTap: () {
        print(index);
      },
      child: Container(
        margin: EdgeInsets.only(top: 20, right: 10, left: 10),
        width: MediaQuery.of(context).size.width,
        height: height,
        decoration: BoxDecoration(
          color: lightBlue,
          borderRadius: BorderRadius.all(Radius.circular(15)),
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
                    child: Image.asset(
                      'assets/images/post_person_image.png',
                      height: 40,
                      width: 40,
                      fit: BoxFit.cover,
                      //color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.9,
                  height: MediaQuery.of(context).size.height / 6.3,
                  padding: EdgeInsets.only(top: 30, right: 5),
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
                    Container(
                      width: 90,
                      height: 20,
                      child: TextClass(
                          text: 'منذ ${index * 2} دقائق',
                          fontSize: height * 0.1,
                          textColor: lightGrey),
                    ),
                    Container(
                      width: 90,
                      height: MediaQuery.of(context).size.height / 10.1,
                      //14.2,
                      child: Image.asset(
                        'assets/images/lost_person_image.png',
                        fit: BoxFit.fill,
                        width: 90,
                      ),
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
