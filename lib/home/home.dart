import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lost_app/shared/components/divider_class.dart';
import 'package:lost_app/shared/components/text_button_class.dart';
import 'package:lost_app/shared/components/text_class.dart';

class HomePageClass extends StatefulWidget {
  const HomePageClass({Key? key}) : super(key: key);

  @override
  _HomePageClassState createState() => _HomePageClassState();
}

class _HomePageClassState extends State<HomePageClass> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            color: HexColor('#E3F0FF'),
            height: 302.0,
            width: 303.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 25.0,
                            child: Image.asset(
                              'assets/icons/post.png',
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 10.0),
                          TextClass(text: 'احمد محمد'),
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
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextClass(
                                text: 'الاسم : محمد احمد محمد',
                                textAlign: TextAlign.right,
                              ),
                              TextClass(
                                text: 'السن : ٢٢',
                                textAlign: TextAlign.right,
                              ),
                              TextClass(
                                text: 'الجنس : ذكر',
                                textAlign: TextAlign.right,
                              ),
                              TextClass(
                                text: 'العنوان : المعادي - القاهره',
                                textAlign: TextAlign.right,
                              ),
                              TextClass(
                                text: 'هاتف التواصل : 0110001111',
                                textAlign: TextAlign.right,
                              ),
                            ],
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/images/lost_person_image.png',
                                //color: Colors.white,
                              ),
                            ),
                          ),
                        ],
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
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 171.5,
                      child: FlatButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            TextClass(
                              text: 'التعليق',
                              fontSize: 22,
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
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 2,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    Container(
                      height: 50,
                      width: 171.5,
                      child: FlatButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextClass(
                              text: 'مشاركه',
                              fontSize: 22,
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
              ],
            ),
          ),
        );
      },
      itemCount: 10,
    );
  }
}
