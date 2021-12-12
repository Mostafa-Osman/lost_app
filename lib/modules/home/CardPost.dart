import 'package:flutter/material.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:hexcolor/hexcolor.dart';

class CardPost extends StatelessWidget {
  const CardPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 273.0,
        decoration: BoxDecoration(
          color: HexColor('#E3F0FF'),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'assets/images/lost_person_image.png',
                          height: 40,
                          width: 40,
                          //color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 10.0),
                      TextClass(
                        text: 'احمد محمد',
                        overflow: TextOverflow.ellipsis,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.more_vert,
                              size: 30,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  TextClass(
                    text: 'مفقود منذ 3 ايام فى القاهره',
                    textAlign: TextAlign.right,
                    fontSize: 15,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    height: 100,
                    child: Row(
                      children: [
                        Container(
                          width: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextClass(
                                text: 'الاسم : محمد محمد محمد احمد محمد',
                                textAlign: TextAlign.right,
                                fontSize: 15,
                                overflow: TextOverflow.ellipsis,
                              ),
                              TextClass(
                                text: 'السن : ٢٢',
                                textAlign: TextAlign.right,
                                fontSize: 15,
                                overflow: TextOverflow.ellipsis,
                              ),
                              TextClass(
                                text: 'الجنس : ذكر',
                                textAlign: TextAlign.right,
                                fontSize: 15,
                                overflow: TextOverflow.ellipsis,
                              ),
                              TextClass(
                                text: 'العنوان : المعادي - القاهره',
                                textAlign: TextAlign.right,
                                fontSize: 15,
                                overflow: TextOverflow.ellipsis,
                              ),
                              TextClass(
                                text: 'هاتف التواصل : 04444444444',
                                textAlign: TextAlign.right,
                                fontSize: 15,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              //height: 200,
                              //width: 200,
                              child: Image.asset(
                                'assets/images/lost_person_image.png',
                                //color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Container(
              height: 2,
              width: double.infinity,
              color: Colors.white,
            ),
            Container(
              height: 48,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Container(
                      child: FlatButton(
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(15),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextClass(
                              text: 'التعليق',
                              fontSize: 20,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 2.0),
                              child: Image.asset(
                                'assets/icons/comment_icon.png',
                                //color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    //height: 60,
                    width: 2,
                    color: Colors.white,
                  ),
                  Expanded(
                    child: FlatButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextClass(
                            text: 'مشاركه',
                            fontSize: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: Image.asset(
                              'assets/icons/share_icon.png',
                              //color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}