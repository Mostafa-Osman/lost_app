import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/authentication/data/repository/authentication_repository.dart';
import 'package:lost_app/authentication/data/repository/authentication_web_service.dart';
import 'package:lost_app/authentication/presentation/login/login_cubit/login_cubit.dart';
import 'package:lost_app/authentication/presentation/login/screen/enter_phone_number.dart';
import 'package:lost_app/authentication/presentation/login/screen/login.dart';
import 'package:lost_app/authentication/presentation/login/screen/reset_password.dart';
import 'package:lost_app/authentication/presentation/register/register_cubit/register_cubit.dart';
import 'package:lost_app/authentication/presentation/register/screen/register_screen.dart';
import 'package:lost_app/authentication/presentation/verify_mobile/screen/otp_screen.dart';
import 'package:lost_app/presentations/add_person_data/ui/add_person_data.dart';
import 'package:lost_app/presentations/comment/ui/comment_arguments.dart';
import 'package:lost_app/presentations/comment/ui/comment_screen.dart';
import 'package:lost_app/presentations/comment/ui/reply_comment_screen.dart';
import 'package:lost_app/presentations/home_layout/ui/home_layout.dart';
import 'package:lost_app/presentations/notification/ui/notification.dart';
import 'package:lost_app/presentations/on_boarding/on_boarding_cubit/on_boarding_cubit.dart';
import 'package:lost_app/presentations/on_boarding/ui/on_boarding.dart';
import 'package:lost_app/presentations/post/ui/post.dart';
import 'package:lost_app/presentations/posts_found/ui/posts_found.dart';
import 'package:lost_app/presentations/processing/ui/processing_page.dart';
import 'package:lost_app/presentations/profile/ui/edit_profile.dart';
import 'package:lost_app/presentations/route/route_constants.dart';
import 'package:lost_app/presentations/search/ui/search_screen.dart';
import 'package:lost_app/presentations/setting/ui/setting.dart';

class AppRouter {
  //Authentication

  late AuthenticationRepository authenticationRepository;
  late AuthenticationWebService authenticationWebService;

  void initAppSettings() {
    //Authentication init
    authenticationWebService = AuthenticationWebService();
    authenticationRepository = AuthenticationRepository(
      authenticationWebService,
    );
  }

  Route? generateRoute(RouteSettings settings) {
    initAppSettings();

    switch (settings.name) {
      case RouteConstant.onBoardingRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider(
            create: (_) => OnBoardingCubit(),
            child: OnBoardingScreen(),
          ),
        );
      case RouteConstant.registerRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => RegisterCubit(authenticationRepository),
            child: RegisterScreen(),
          ),
        );
      case RouteConstant.loginRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => LoginCubit(authenticationRepository),
            child: LoginScreen(),
          ),
        );
      case RouteConstant.phoneNumberRoute:
        return MaterialPageRoute(builder: (_) => PhoneNumberScreen());
      case RouteConstant.resetPasswordRoute:
        return MaterialPageRoute(builder: (_) => ResetPasswordScreen());
      case RouteConstant.homeLayoutRoute:
        return MaterialPageRoute(builder: (_) => HomeLayoutScreen());
      case RouteConstant.addPersonDataRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            final String textPost = settings.arguments! as String;
            return AddPersonDataScreen(
              textPost: textPost,
            );
          },
        );

      case RouteConstant.commentRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            final CommentArguments arguments =
                settings.arguments! as CommentArguments;
            final CommentArguments details = arguments;
            return CommentScreen(details: details);
          },
        );

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
      case RouteConstant.otpRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            final bool arguments = settings.arguments! as bool;
            final isFromResetPhone = arguments;

            return VerifyMobileScreen(isFromResetPhone: isFromResetPhone);
          },
        );
      case RouteConstant.replyCommentRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            final CommentArguments arguments =
                settings.arguments! as CommentArguments;
            final details = arguments;
            return ReplyCommentScreen(details: details);
          },
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}