import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lost_app/app/router/route_names.dart';
import 'package:lost_app/shared/components/navigator.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class HomePageAppBar extends StatefulWidget implements PreferredSizeWidget {
  HomePageAppBar({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);
  final TextEditingController homeAppBarController = TextEditingController();

  @override
  final Size preferredSize; // default is 56.0

  @override
  _HomePageAppBarState createState() => _HomePageAppBarState();
}

class _HomePageAppBarState extends State<HomePageAppBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: AppBar(
        backgroundColor: white,
        elevation: 0.0,
        toolbarHeight: 55,
        title:  SizedBox(
          width: double.infinity,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: SvgPicture.asset(
                'assets/images/home_logo.svg',
                height: 65,
              ),
            ),
          ),
        ),
        // Center(0
        //   child: Container(
        //       decoration: const BoxDecoration(
        //         color: white,
        //         //borderRadius: BorderRadius.circular(15),
        //       ),
        //       child: Padding(
        //         padding: const EdgeInsets.all(5.0),
        //         child: Container(
        //           height: 45,
        //           width: double.infinity,
        //           decoration: BoxDecoration(
        //             borderRadius: const BorderRadius.all(
        //               Radius.circular(10),
        //             ),
        //             border: Border.all(
        //
        //             ),
        //           ),
        //           child: Material(
        //             shape: const RoundedRectangleBorder(
        //               borderRadius: BorderRadius.all(
        //                 Radius.circular(10),
        //               ),
        //             ),
        //             child: InkWell(
        //               onTap: () => navigateTo(context, RouteConstant.searchRoute),
        //               child:const Padding(
        //                 padding:  EdgeInsets.only(top: 5.0, right: 10),
        //                 child: Align(
        //                   alignment: Alignment.centerRight,
        //                   child: TextClass(
        //                     text: 'البحث...',
        //                     textColor: grey,
        //                     overflow: TextOverflow.ellipsis,
        //                   ),
        //                 ),
        //               ),
        //             ),
        //           ),
        //         ),
        //       ),),
        // ),
        leading: Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: IconButton(
            iconSize: 2,
            icon: SvgPicture.asset(
              'assets/icons/notification.svg',
            ),
            onPressed: () =>
                navigateTo(context, RouteConstant.notificationRoute),
          ),
        ),
      ),
    );
  }
}

class AccountPageAppBar extends StatefulWidget implements PreferredSizeWidget {
  AccountPageAppBar({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);
  final TextEditingController accAppBarController = TextEditingController();
  @override
  final Size preferredSize; // default is 56.0

  @override
  _AccountPageAppBarState createState() => _AccountPageAppBarState();
}

class _AccountPageAppBarState extends State<AccountPageAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: white,
      elevation: 0.0,
      toolbarHeight: 55,
      title: const Center(
        child: TextClass(
          text: 'الملف الشخصي',
          fontSize: 20,
        ),
      ),
      leading: Padding(
        padding: const EdgeInsets.only(right: 15.0),
        child: IconButton(
          iconSize: 28,
          color: black,
          icon: const Icon(
            Icons.settings_rounded,
          ),
          onPressed: () {
            navigateTo(context, RouteConstant.settingRoute);
          },
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: IconButton(
            iconSize: 28,
            color: black,
            icon: SvgPicture.asset('assets/icons/profile_acc_ic.svg'),
            onPressed: () =>
                navigateTo(context, RouteConstant.editProfileRoute),
          ),
        ),
      ],
    );
  }
}
