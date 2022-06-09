import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/data/local/pref/user_pref.dart';
import 'package:lost_app/post/widgets/card_type_post.dart';
import 'package:lost_app/presentations/home_layout/home_layout_cubit/home_cubit.dart';
import 'package:lost_app/presentations/route/route_constants.dart';
import 'package:lost_app/shared/components/navigator.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class PostTypeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextClass(
          text: 'اختر نوع المنشور',
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_sharp, color: black),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: white,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              color: white,
              child: Column(
                children:  [
                  const  CardPostPage(
                    image: 'assets/images/welcome_1.svg',
                    text: 'ابحث عن احد المفقودين',
                    size: 250,
                    optionText: 'مكان الفقدان',
                  ),
                  const  SizedBox(height: 20),
                  const  CardPostPage(
                    image: 'assets/images/lost_post.svg',
                    text: 'وجدت احد المفقودين',
                    size: 200,
                    optionText: 'مكان العثور',
                  ),
                  ListTile(
                    onTap: () {
                      BlocProvider.of<HomeLayoutCubit>(context)
                          .changeBottomNavBarIndexAndColor(0);
                      UserPrefs().deleteUserToken();
                      navigateTo(context, RouteConstant.loginRoute);
                    },
                    title: const TextClass(
                      text: 'تسجيل خروج',
                      textAlign: TextAlign.start,
                      fontSize: 20,
                      textColor: red,
                    ),
                    trailing:
                    const Icon(Icons.arrow_back_ios_new_outlined, color: red),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
