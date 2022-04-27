import 'package:flutter/material.dart';
import 'package:lost_app/modules/add_person_data/ui/add_person_data.dart';
import 'package:lost_app/modules/comment/ui/comment_arguments.dart';
import 'package:lost_app/modules/comment/ui/comment_screen.dart';
import 'package:lost_app/modules/comment/ui/reply_comment_screen.dart';
import 'package:lost_app/modules/home_layout/ui/home_layout.dart';
import 'package:lost_app/modules/login/ui/enter_phone_number.dart';
import 'package:lost_app/modules/login/ui/login.dart';
import 'package:lost_app/modules/login/ui/reset_password.dart';
import 'package:lost_app/modules/notification/ui/notification.dart';
import 'package:lost_app/modules/on_boarding/ui/on_boarding.dart';
import 'package:lost_app/modules/post/ui/post.dart';
import 'package:lost_app/modules/posts_found/ui/posts_found.dart';
import 'package:lost_app/modules/processing/ui/processing_page.dart';
import 'package:lost_app/modules/profile/ui/edit_profile.dart';
import 'package:lost_app/modules/register/ui/register.dart';
import 'package:lost_app/modules/route/route_constants.dart';
import 'package:lost_app/modules/search/ui/search_screen.dart';
import 'package:lost_app/modules/setting/ui/setting.dart';
import 'package:lost_app/modules/verify_mobile/ui/verify_mobile.dart';

class AppRouter {
   Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstant.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());
      case RouteConstant.registerRoute:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case RouteConstant.loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case RouteConstant.phoneNumberRoute:
        return MaterialPageRoute(builder: (_) => PhoneNumberScreen());
      case RouteConstant.resetPasswordRoute:
        return MaterialPageRoute(builder: (_) => ResetPasswordScreen());
      case RouteConstant.homeLayoutRoute:
        return MaterialPageRoute(builder: (_) => HomeLayoutScreen());
      case RouteConstant.addPersonDataRoute:
        return MaterialPageRoute(
        settings:settings ,

        builder: (_) {
          final String textPost = settings.arguments! as String;
          return AddPersonDataScreen(
            textPost: textPost,
          );
        },);

      case RouteConstant.commentRoute:
        return MaterialPageRoute(
          settings:settings ,
          builder: (_) {
          final CommentArguments arguments =
          settings.arguments!  as CommentArguments;
          final CommentArguments details = arguments;
          return CommentScreen(details: details);
        },);

      case RouteConstant.notificationRoute:
        return MaterialPageRoute(builder: (_) => NotificationScreen());
      case RouteConstant.postRoute:
        return MaterialPageRoute(builder: (_) => PostScreen());
      case RouteConstant.postsFoundRoute:
        return MaterialPageRoute(builder: (_) => PostsFoundScreen());
      case RouteConstant.processingRoute:
        return MaterialPageRoute(builder: (_) => ProcessingScreen());
      case RouteConstant.editProfileRoute:
        return MaterialPageRoute(builder: (_) => EditProfileScreen());
      case RouteConstant.searchRoute:
        return MaterialPageRoute(builder: (_) => SearchScreen());
      case RouteConstant.settingRoute:
        return MaterialPageRoute(builder: (_) => SettingScreen());
      case RouteConstant.verifyRoute:
        return MaterialPageRoute(
            settings:settings ,
            builder: (_) {
          final bool arguments = settings.arguments! as bool;
          final isFromResetPhone = arguments;

          return VerifyMobileScreen(isFromResetPhone: isFromResetPhone);
        },);
      case RouteConstant.replyCommentRoute:
        return MaterialPageRoute(
            settings:settings ,
            builder: (_) {
          final CommentArguments arguments =
              settings.arguments! as CommentArguments;
          final details = arguments;
          return ReplyCommentScreen(details: details);
        },);

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}'),),
                ),);
    }
  }
}
