import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lost_app/modules/home/CardPost.dart';
import 'package:lost_app/shared/components/text_class.dart';

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
                      text: 'منصور طارق منصور',
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
                  AccountTextFormField(text: 'mansourtarek@gmail.com', icon: Icons.email),
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
              return CardPost();
            },
            itemCount: 10,
          ),
        ],
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
            color: Colors.black,
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
