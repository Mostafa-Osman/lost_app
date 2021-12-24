import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lost_app/modules/profile/profile.dart';
import 'package:lost_app/shared/components/appbar_widget.dart';
import 'package:lost_app/modules/home/home.dart';
import 'package:lost_app/modules/post/post.dart';
import 'package:lost_app/shared/components/component.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class HomeLayout extends StatefulWidget {
  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  Color bottomNavBarAccColor = grey;
  Color bottomNavBarHomeColor = BottomNavBarBlue;
  int indexPage = 0;
  Map<int, PreferredSizeWidget> appBar = {
    0: HomePageAppBar(),
    1: AccountPageAppBar(),
  };
  Map<int, Widget> page = {
    0: HomeClass(),
    1: ProfileClass(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar[indexPage],
      body: page[indexPage],

      floatingActionButton: FloatingActionButton(
        backgroundColor: BottomNavBarBlue,
        //Floating action button on Scaffold
        onPressed: () {
          navigateTo(context, PostScreen());
        },
        child: SvgPicture.asset('assets/icons/post.svg',
           color: white
        ),

        //icon inside button
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //floating action button position to center

      bottomNavigationBar: BottomAppBar(
        //bottom navigation bar on scaffold
        color: white,
        shape: CircularNotchedRectangle(),
        elevation: 10.0,
        //shape of notch
        notchMargin: 10,
        child: Container(
          height: 67,
          child: Row(
            //children inside bottom appbar
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: InkWell(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Column(
                      children: [
                        IconButton(
                          iconSize: 10,
                          highlightColor: black,
                          icon: SvgPicture.asset('assets/icons/account.svg',
                              color: bottomNavBarAccColor),
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
                  onTap: () {
                    setState(() {
                      if (indexPage != 1) {
                        bottomNavBarAccColor = BottomNavBarBlue;
                        bottomNavBarHomeColor = grey;
                        indexPage = 1;
                      }
                    });
                  },
                ),
              ),
              SizedBox(
                width: 80,
              ),
              Expanded(
                child: FlatButton(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      children: [
                        IconButton(
                          iconSize: 10,
                          icon: SvgPicture.asset('assets/icons/home.svg',
                              color: bottomNavBarHomeColor),
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
                        bottomNavBarHomeColor = BottomNavBarBlue;
                        bottomNavBarAccColor = grey;
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
