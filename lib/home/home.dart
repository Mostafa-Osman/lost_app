import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
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
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 287.0,
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
                                text: 'هاتف التواصل : 04444444444',
                                textAlign: TextAlign.right,
                              ),
                            ],
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    height: 86,
                                    width: 86,
                                    child: Image.asset(
                                      'assets/images/lost_person_image.png',
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
                              borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                      ),
                      Container(
                        height: 48,
                        width: 2,
                        color: Colors.white,
                      ),
                      Expanded(
                        child: FlatButton(
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
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
