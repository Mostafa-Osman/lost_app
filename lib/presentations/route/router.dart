import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/authentication/data/repository/authentication_repository.dart';
import 'package:lost_app/authentication/data/web_services/authentication_web_service.dart';
import 'package:lost_app/authentication/presentation/forget_password/screen/enter_phone_number.dart';
import 'package:lost_app/authentication/presentation/forget_password/screen/reset_password.dart';
import 'package:lost_app/authentication/presentation/login/login_cubit/login_cubit.dart';
import 'package:lost_app/authentication/presentation/login/screen/login.dart';
import 'package:lost_app/authentication/presentation/otp/otp_cubit/otp_cubit.dart';
import 'package:lost_app/authentication/presentation/otp/screen/otp_screen.dart';
import 'package:lost_app/authentication/presentation/register/screen/register_screen.dart';
import 'package:lost_app/data/local/pref/user_pref.dart';
import 'package:lost_app/data/models/home/post_model.dart';
import 'package:lost_app/data/repositories/home/home_repistory.dart';
import 'package:lost_app/data/web_services/home_web_service.dart';
import 'package:lost_app/post/create_post/screen/create_post.dart';
import 'package:lost_app/post/create_post/screen/post_type.dart';
import 'package:lost_app/post/create_post/screen/posts_found.dart';
import 'package:lost_app/post/create_post/screen/scan_data.dart';
import 'package:lost_app/post/create_post_cubit/create_post_cubit.dart';
import 'package:lost_app/post/data/repositories/create_post_repository.dart';
import 'package:lost_app/post/data/web_services/create_post_web_services.dart';
import 'package:lost_app/presentations/home/bloc/home_cubit.dart';
import 'package:lost_app/presentations/home/screen/post_details_screen.dart';
import 'package:lost_app/presentations/home/screen/reply_comment_screen.dart';
import 'package:lost_app/presentations/home_layout/ui/home_layout.dart';
import 'package:lost_app/presentations/notification/ui/notification.dart';
import 'package:lost_app/presentations/on_boarding/on_boarding_cubit/on_boarding_cubit.dart';
import 'package:lost_app/presentations/on_boarding/ui/on_boarding.dart';
import 'package:lost_app/presentations/route/route_constants.dart';
import 'package:lost_app/presentations/search/ui/search_screen.dart';
import 'package:lost_app/profile/screen/edit_profile.dart';

class AppRouter {
  late UserPrefs userPrefs;

  //Authentication

  late AuthenticationRepository authenticationRepository;
  late AuthenticationWebService authenticationWebService; //Authentication

  late CreatePostRepository createPostRepository;
  late CreatePostWebServices createPostWebServices;

  // home page
  late HomeRepository homeRepository;
  late HomeWebService homeWebService;

  void initAppSettings() {
    userPrefs = UserPrefs();

    //Authentication init
    authenticationWebService = AuthenticationWebService();
    authenticationRepository = AuthenticationRepository(
      authenticationWebService,
    );

    // home init
    homeWebService = HomeWebService();
    homeRepository = HomeRepository(homeWebService);
    //create post init
    createPostWebServices = CreatePostWebServices(userPrefs);
    createPostRepository = CreatePostRepository(
      createPostWebServices,
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
            create: (_) => OtpCubit(authenticationRepository, userPrefs),
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
        return MaterialPageRoute(
          builder: (_) => HomeLayoutScreen(),
        );
        if (userPrefs.isUserLoggedIn()) {
          return MaterialPageRoute(
            builder: (_) => HomeLayoutScreen(),
          );
        } else {
          return MaterialPageRoute(
            builder: (_) => LoginScreen(),
          );
        }
      case RouteConstant.createPostRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            return CreatePostScreen();
          },
        );

      case RouteConstant.commentRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            final arguments = settings.arguments! as List;
            return BlocProvider(
              create: (context) => HomeCubit(homeRepository)
                ..getHomeData()
                ..getPostData(arguments[1] as int),
              child: PostDetailsScreen(
                autofocus: arguments[0] as bool,
                postId: arguments[1] as int,
                postIndex: arguments[2] as int,
              ),
            );
          },
        );

      case RouteConstant.notificationRoute:
        return MaterialPageRoute(builder: (_) => NotificationScreen());
      case RouteConstant.postType:
        return MaterialPageRoute(builder: (_) => PostTypeScreen());
      case RouteConstant.postsFoundRoute:
        return MaterialPageRoute(builder: (_) => PostsFoundScreen());
      case RouteConstant.scanDataRoute:
        return MaterialPageRoute(builder: (_) => ScanScreen());
      case RouteConstant.editProfileRoute:
        return MaterialPageRoute(builder: (_) => EditProfileScreen());
      case RouteConstant.searchRoute:
        return MaterialPageRoute(builder: (_) => SearchScreen());

      case RouteConstant.otpRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider(
            create: (_) => OtpCubit(
              authenticationRepository,
              userPrefs,
            ),
            child: const OtpScreen(),
          ),
        );
      case RouteConstant.replyCommentRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            final arguments = settings.arguments! as Map;
            return ReplyCommentScreen(
              autofocus: arguments['autofocus'] as bool,
              postId: arguments['postId'] as int,
              postIndex: arguments['postIndex'] as int,
              commentIndex: arguments['commentIndex'] as int,
              parentCommentId: arguments['parentCommentId'] as int,
              parentCommentIndex: arguments['parentCommentIndex'] as int,
            );
          },
        );

      default:
        return null;
    }
  }
}
