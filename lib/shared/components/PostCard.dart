import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lost_app/modules/comment/comment_screen.dart';
import 'package:lost_app/shared/components/component.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class PostCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Material(
                color: lightBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                ),
                child: InkWell(
                  onTap: () => navigateTo(context, CommentScreen(details: {})),
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15),
                    ),
                  ),
                  splashColor: grey,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            ClipOval(
                              child: Image.asset(
                                'assets/images/IMG20201116145812.jpg',
                                width: size.width >= 500 ? 40 : size.width / 10,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 5.0),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: TextClass(
                                text: 'منصور طارق منصور',
                                fontSize:
                                    size.width >= 500 ? 20 : size.width / 20,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.more_vert,
                                size: size.width >= 500 ? 30 : size.width / 18,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: TextClass(
                                      text: 'مفقود منذ 3 ايام فى دار السلام',
                                      textAlign: TextAlign.right,
                                      fontSize: 15,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(height: 20.0),
                                  FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextClass(
                                            text: 'الاسم : مصطفى عثمان',
                                            textAlign: TextAlign.right,
                                            fontSize: 15,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(height: 2),
                                          TextClass(
                                            text: 'السن : ٢٢',
                                            textAlign: TextAlign.right,
                                            fontSize: 15,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(height: 2),
                                          TextClass(
                                            text: 'الجنس : ذكر',
                                            textAlign: TextAlign.right,
                                            fontSize: 15,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(height: 2),
                                          TextClass(
                                            text: 'العنوان : المعادي - القاهره',
                                            textAlign: TextAlign.right,
                                            fontSize: 15,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(height: 2),
                                          TextClass(
                                            text: 'هاتف التواصل : 01149589134',
                                            textAlign: TextAlign.right,
                                            fontSize: 15,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(height: 2),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(width: 5),
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: 120,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: SvgPicture.asset(
                                    'assets/images/login.svg',
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 2,
                    width: double.infinity,
                    color: white,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Material(
                          color: lightBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(15),
                            ),
                          ),
                          child: InkWell(
                            onTap: () =>
                                navigateTo(context, CommentScreen(details: {}, autofocus: true,)),
                            splashColor: grey,
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(15),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: TextClass(
                                      text: 'التعليق',
                                      fontSize: size.width >= 500
                                          ? 19
                                          : size.width / 18,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 2.0),
                                    child: SvgPicture.asset(
                                        'assets/icons/comment_icon.svg',
                                        width: size.width >= 500
                                            ? 30
                                            : size.width / 18),
                                    // Image.asset(
                                    //   'assets/icons/comment_icon.png',
                                    //   width: size.width >= 500? 30 : size.width/18,
                                    //   //color: Colors.white,
                                    // ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 2,
                        color: white,
                      ),
                      Expanded(
                        child: Material(
                          color: lightBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                            ),
                          ),
                          child: InkWell(
                            onTap: () {},
                            splashColor: grey,
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TextClass(
                                    text: 'مشاركه',
                                    fontSize: size.width >= 500
                                        ? 19
                                        : size.width / 18,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 2.0),
                                    child: SvgPicture.asset(
                                      'assets/icons/share_icon.svg',
                                      width: size.width >= 500
                                          ? 34
                                          : size.width / 18,
                                    ),
                                    // Image.asset(
                                    //   'assets/icons/share_icon.png',
                                    //   width: size.width >= 500
                                    //       ? 34
                                    //       : size.width / 18,
                                    // ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
      itemCount: 10,
    );
  }
}
