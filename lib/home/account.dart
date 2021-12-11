import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/components/text_form_field_class.dart';

class AccountPageClass extends StatefulWidget {
  const AccountPageClass({Key? key}) : super(key: key);

  @override
  _AccountPageClassState createState() => _AccountPageClassState();
}

class _AccountPageClassState extends State<AccountPageClass> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 500.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/lost_person_image.png',
                        height: 180,
                        width: 180,
                        fit: BoxFit.cover,
                        //color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: TextClass(
                      text: 'محمد احمد',
                      fontSize: 30,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 55,
                      //padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                        shape: BoxShape.rectangle,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 7.0),
                            child: TextClass(
                              text: '01149589134',
                              fontSize: 18,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 5.0,
                            ),
                            child: IconButton(
                              iconSize: 25,
                              icon: Icon(Icons.phone),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 55,
                      //padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                        shape: BoxShape.rectangle,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 7.0),
                            child: TextClass(
                              text: 'mansourtarek100@gmail.com',
                              fontSize: 18,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 5.0,
                            ),
                            child: IconButton(
                              iconSize: 25,
                              icon: Icon(Icons.email),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: TextClass(
                      text: 'المنشورات',
                      fontSize: 30,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
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
                              fontSize: 15,
                            ),
                            SizedBox(height: 20.0),
                            Container(
                              height: 100,
                              child: Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextClass(
                                        text: 'الاسم : محمد احمد محمد',
                                        textAlign: TextAlign.right,
                                        fontSize: 15,
                                      ),
                                      TextClass(
                                        text: 'السن : ٢٢',
                                        textAlign: TextAlign.right,
                                        fontSize: 15,
                                      ),
                                      TextClass(
                                        text: 'الجنس : ذكر',
                                        textAlign: TextAlign.right,
                                        fontSize: 15,
                                      ),
                                      TextClass(
                                        text: 'العنوان : المعادي - القاهره',
                                        textAlign: TextAlign.right,
                                        fontSize: 15,
                                      ),
                                      TextClass(
                                        text: 'هاتف التواصل : 04444444444',
                                        textAlign: TextAlign.right,
                                        fontSize: 15,
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      TextClass(
                                        text: 'التعليق',
                                        fontSize: 22,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 2.0),
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
                                      fontSize: 22,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 5.0),
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
          ),
        ],
      ),
    );
  }
}
