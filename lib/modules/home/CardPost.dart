import 'package:flutter/material.dart';
import 'package:lost_app/modules/home/comment_screen.dart';
import 'package:lost_app/shared/components/component.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:hexcolor/hexcolor.dart';

class CardPost extends StatelessWidget {
  const CardPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (ctx, index) {
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
                FlatButton(
                  onPressed: () {
                    navigateTo(context, CommentScreen(details: {}));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 17.0, right: 2, left: 2, bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            ClipOval(
                              child: Image.asset(
                                'assets/images/IMG20201116145812.jpg',
                                height: 40,
                                width: 40,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 10.0),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: TextClass(
                                text: 'Mansour Tarek',
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.more_vert,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        TextClass(
                          text: 'مفقود منذ 3 ايام فى دار السلام',
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
                                      text: 'الاسم : مصطفى عثمان',
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
                                      text: 'هاتف التواصل : 01149589134',
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
                                      'assets/images/IMG20201115111300.jpg',
                                      fit: BoxFit.cover,
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
      },
      itemCount: 10,
    );

  }
}
