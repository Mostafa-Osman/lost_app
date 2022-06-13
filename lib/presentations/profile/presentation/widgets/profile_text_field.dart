import 'package:flutter/material.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class ProfileTextField extends StatelessWidget {
  final String text;
  final IconData icon;

  const ProfileTextField({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          color: lightBlue,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: ListView(
            scrollDirection: Axis.horizontal,
            reverse: true,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 7.0),
                    child: TextClass(
                      text: text,
                      fontSize: size.width >= 500 ? 18 : size.width / 22,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    iconSize: size.width >= 500 ? 25 : size.width / 20,
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