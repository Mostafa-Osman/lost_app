import 'package:flutter/material.dart';
import 'package:lost_app/shared/components/PostCard.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class ProfileClass extends StatefulWidget {
  const ProfileClass({Key? key}) : super(key: key);

  @override
  _ProfileClassState createState() => _ProfileClassState();
}

class _ProfileClassState extends State<ProfileClass> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Align(
        alignment: Alignment.center,
        child: Container(
            width: 500,
            child:Column(
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
                              color: black,
                              width: 1,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/IMG20201116145812.jpg',
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
                            text: 'منصور طارق',
                            fontSize: 30,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        AccountTextFormField(text: '01149589134', icon: Icons.phone),
                        SizedBox(
                          height: 3,
                        ),
                        AccountTextFormField(text: 'mansourtarek100@gmail.com', icon: Icons.email),
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
                PostCard(),

              ],
            ),
        ),
      ),
    );
  }
}


class AccountTextFormField extends StatelessWidget {
  final String text;
  final IconData icon;
  AccountTextFormField({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          border: Border.all(
            color: black,
            width: 1,
          ),
          shape: BoxShape.rectangle,
        ),
        child: Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          child: ListView(
            scrollDirection: Axis.horizontal,
            reverse: true,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 7.0),
                    child: TextClass(
                      text: text,
                      fontSize: 18,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    iconSize: 25,
                    icon: Icon(icon),
                    onPressed: () {},
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
