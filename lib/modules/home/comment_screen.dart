import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/components/text_form_field_class.dart';
import 'package:lost_app/shared/styles/color.dart';
import 'dart:math' as math;

class CommentScreen extends StatelessWidget {
  final Map<String, Object> details;
  TextEditingController commentController = TextEditingController();

  CommentScreen({required this.details});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: black, //change your color here
        ),
      ),
      body: Container(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      color: white,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                          top: 5,
                          bottom: 15,
                        ),
                        child: Container(
                          //height: 1000.0,
                          decoration: BoxDecoration(
                            color: HexColor('#E3F0FF'),
                            borderRadius:
                            BorderRadius.all(Radius.circular(15)),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 17.0,
                                    right: 15,
                                    left: 15,
                                    bottom: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
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
                                          padding: const EdgeInsets.only(
                                              top: 10.0),
                                          child: TextClass(
                                            text: 'احمد محمد',
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
                                      text: 'مفقود منذ 3 ايام فى القاهره',
                                      textAlign: TextAlign.right,
                                      fontSize: 15,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 20.0),
                                    Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 100,
                                          child: Container(
                                            width: 200,
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                TextClass(
                                                  text:
                                                  'الاسم : محمد محمد محمد احمد محمد',
                                                  textAlign: TextAlign.right,
                                                  fontSize: 15,
                                                  overflow:
                                                  TextOverflow.ellipsis,
                                                ),
                                                TextClass(
                                                  text: 'السن : ٢٢',
                                                  textAlign: TextAlign.right,
                                                  fontSize: 15,
                                                  overflow:
                                                  TextOverflow.ellipsis,
                                                ),
                                                TextClass(
                                                  text: 'الجنس : ذكر',
                                                  textAlign: TextAlign.right,
                                                  fontSize: 15,
                                                  overflow:
                                                  TextOverflow.ellipsis,
                                                ),
                                                TextClass(
                                                  text:
                                                  'العنوان : المعادي - القاهره',
                                                  textAlign: TextAlign.right,
                                                  fontSize: 15,
                                                  overflow:
                                                  TextOverflow.ellipsis,
                                                ),
                                                TextClass(
                                                  text:
                                                  'هاتف التواصل : 04444444444',
                                                  textAlign: TextAlign.right,
                                                  fontSize: 15,
                                                  overflow:
                                                  TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                alignment: Alignment.center,
                                                child: Image.asset(
                                                  'assets/images/IMG20201115111300.jpg',
                                                  fit: BoxFit.cover,
                                                  //color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 2,
                                width: double.infinity,
                                color: Colors.white,
                              ),
                              Container(
                                height: 55,
                                child: Container(
                                  child: FlatButton(
                                    onPressed: () {},
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        TextClass(
                                          text: 'مشاركه',
                                          fontSize: 20,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 5.0),
                                          child: Image.asset(
                                            'assets/icons/share_icon.png',
                                            //color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 100),
                  ],
                ),
              ),
            ),
            Container(
                alignment: Alignment.bottomCenter,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Card(
                      elevation: 10,
                      child: Container(
                        height: 90,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: 15, left: 15),
                                child: Container(
                                  child: TextFormFieldClass(
                                    controller: commentController,
                                    roundedRectangleBorder: 6,
                                    textHint: 'اكتب تعليقا ...',
                                    prefix: Transform(
                                      alignment: Alignment.center,
                                      transform: Matrix4.rotationY(math.pi),
                                      child: IconButton(
                                        icon: Icon(Icons.send_rounded),
                                        iconSize: 30.0,
                                        color: Colors.blue,
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
