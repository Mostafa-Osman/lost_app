part of 'router_imports.dart';

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

  // post details
  late PostDetailsRepository postDetailsRepository;
  late PostDetailsWebService postDetailsWebService;

  void initAppSettings() {
    userPrefs = UserPrefs();

    //Authentication init
    authenticationWebService = AuthenticationWebService();
    authenticationRepository = AuthenticationRepository(
      authenticationWebService,
    );

    // home init
    homeWebService = HomeWebService(userPrefs);
    homeRepository = HomeRepository(homeWebService);

    // post details init
    postDetailsWebService = PostDetailsWebService(userPrefs);
    postDetailsRepository = PostDetailsRepository(postDetailsWebService);

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
      //return
      //   MaterialPageRoute(
      //   settings: settings,
      //   builder: (_) {
      //     return HomeLayoutScreen();
      //   },
      // );

      //   MaterialPageRoute(
      //   builder: (_) {
      //     return BlocProvider(
      //       create: (context) => HomeCubit(homeRepository)..onRefresh(),
      //       child: HomeLayoutScreen(),
      //     );
      //   },
      // );

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
              create: (context) => PostDetailsCubit(postDetailsRepository)
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
      case RouteConstant.settingRoute:
        return MaterialPageRoute(builder: (_) => SettingScreen());
      case RouteConstant.savedPostsRoute:
        return MaterialPageRoute(builder: (_) => SavedPostsScreen());
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
            return BlocProvider(
              create: (context) => PostDetailsCubit(postDetailsRepository),
              child: ReplyCommentScreen(
                autofocus: arguments['autofocus'] as bool,
                postId: arguments['postId'] as int,
                postIndex: arguments['postIndex'] as int,
                commentIndex: arguments['commentIndex'] as int,
                parentCommentId: arguments['parentCommentId'] as int,
                parentCommentIndex: arguments['parentCommentIndex'] as int,
              ),
            );
          },
        );
      case RouteConstant.changePort:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => ChangePortScreen(),
        );
      default:
        return null;
    }
  }
}
