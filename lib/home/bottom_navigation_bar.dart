import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lost_app/home/home.dart';
import 'package:lost_app/shared/components/text_form_field_class.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController controller = TextEditingController();
  Color bottomNavBarAccColor = Colors.grey;
  Color bottomNavBarHomeColor = HexColor('#2DC7FF');

  PreferredSizeWidget appbar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      toolbarHeight: 80,
      title: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextFormFieldClass(
            controller: controller,
            textHint: 'البحث...',
          )),
      leading: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: IconButton(
          iconSize: 0.5,
          icon: Image.asset(
          'assets/icons/notification.png',
          color: Colors.black,
        ),
          onPressed: () {},
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),

      body: HomePageClass(),

      floatingActionButton: FloatingActionButton(
        backgroundColor: HexColor('#2DC7FF'),
        //Floating action button on Scaffold
        onPressed: () {
          //code to execute on button press
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
        notchMargin: 8,
        //notche margin between floating button and bottom appbar
        child: Container(
          height: 60,
          child: Row(
            //children inside bottom appbar
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Image.asset(
                  'assets/icons/account.png',
                  color: bottomNavBarAccColor,
                ),
                onPressed: () {
                  setState(() {
                    bottomNavBarAccColor = HexColor('#2DC7FF');
                    bottomNavBarHomeColor = Colors.grey;
                  });
                },
              ),
              SizedBox(
                width: 0,
              ),
              IconButton(
                icon: Image.asset(
                  'assets/icons/home.png',
                  color: bottomNavBarHomeColor,
                ),
                onPressed: () {
                  setState(() {
                    bottomNavBarHomeColor = HexColor('#2DC7FF');
                    bottomNavBarAccColor = Colors.grey;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
