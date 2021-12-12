import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lost_app/modules/home/account.dart';
import 'package:lost_app/modules/home/appbar_widget.dart';
import 'package:lost_app/modules/home/home.dart';
import 'package:lost_app/modules/home/post.dart';
import 'package:lost_app/shared/components/component.dart';
import 'package:lost_app/shared/components/text_button_class.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/components/text_form_field_class.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color bottomNavBarAccColor = Colors.grey;
  Color bottomNavBarHomeColor = HexColor('#2DC7FF');
  int indexPage = 0;
  Map<int, PreferredSizeWidget> appBar = {
    0: HomePageAppBar(),
    1: AccountPageAppBar(),
  };
  Map<int, Widget> page = {
    0: HomePageClass(),
    1: AccountPageClass(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar[indexPage],
      body: page[indexPage],

      floatingActionButton: FloatingActionButton(
        backgroundColor: HexColor('#2DC7FF'),
        //Floating action button on Scaffold
        onPressed: () {
          navigateTo(context, PostScreen());
        },
        child: Image.asset(
          'assets/icons/post.png',
          color: Colors.white,
        ), //icon inside button
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //floating action button position to center

      bottomNavigationBar: BottomAppBar(
        //bottom navigation bar on scaffold
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        elevation: 10.0,
        //shape of notch
        notchMargin: 10,
        //notche margin between floating button and bottom appbar
        child: Container(
          height: 70,
          child: Row(
            //children inside bottom appbar
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Column(
                      children: [
                        IconButton(
                          iconSize: 10,
                          highlightColor: Colors.black,
                          icon: Image.asset(
                            'assets/icons/account.png',
                            color: bottomNavBarAccColor,
                          ),
                          onPressed: null,

                        ),
                        TextClass(
                          text: 'حسابي',
                          textColor: bottomNavBarAccColor,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ],
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      if (indexPage != 1) {
                        bottomNavBarAccColor = HexColor('#2DC7FF');
                        bottomNavBarHomeColor = Colors.grey;
                        indexPage = 1;
                      }
                    });
                  },
                ),
              ),
              SizedBox(width: 80,),
              Expanded(
                child: FlatButton(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      children: [
                        IconButton(
                          iconSize: 10,
                          icon: Image.asset(
                            'assets/icons/home.png',
                            color: bottomNavBarHomeColor,
                          ),
                          onPressed: null,
                        ),
                        TextClass(
                          text: 'الرئيسيه',
                          textColor: bottomNavBarHomeColor,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ],
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      if (indexPage != 0) {
                        bottomNavBarHomeColor = HexColor('#2DC7FF');
                        bottomNavBarAccColor = Colors.grey;
                        indexPage = 0;
                      }
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
