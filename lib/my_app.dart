import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lost_app/app/common/data/local/pref/user_pref.dart';
import 'package:lost_app/app/modules/authentication/data/repository/authentication_repository.dart';
import 'package:lost_app/app/modules/authentication/data/web_services/authentication_web_service.dart';
import 'package:lost_app/app/modules/authentication/presentation/forget_password/reset_password_cubit/reset_password_cubit.dart';
import 'package:lost_app/app/modules/authentication/presentation/login/login_cubit/login_cubit.dart';
import 'package:lost_app/app/modules/authentication/presentation/otp/otp_cubit/otp_cubit.dart';
import 'package:lost_app/app/modules/authentication/presentation/register/screen/register_screen.dart';
import 'package:lost_app/app/modules/home/bloc/home_cubit.dart';
import 'package:lost_app/app/modules/home/data/home_repository/home_repistory.dart';
import 'package:lost_app/app/modules/home/data/home_web_services/home_web_service.dart';
import 'package:lost_app/app/modules/home_layout/bloc/home_cubit.dart';
import 'package:lost_app/app/modules/on_boarding/on_boarding_cubit/on_boarding_cubit.dart';
import 'package:lost_app/app/modules/post/create_post_cubit/create_post_cubit.dart';
import 'package:lost_app/app/modules/post/data/repositories/create_post_repository.dart';
import 'package:lost_app/app/modules/post/data/web_services/create_post_web_services.dart';
import 'package:lost_app/app/modules/profile/bloc/profile_cubit.dart';
import 'package:lost_app/app/modules/profile/data/profile_repository/profile_repository.dart';
import 'package:lost_app/app/modules/profile/data/profile_web_service/profile_web_service.dart';
import 'package:lost_app/app/modules/search/search_cubit/search_cubit.dart';
import 'package:lost_app/app/router/router_imports.dart';
import 'package:lost_app/shared/bottom_sheet/cubit/select_bottom_sheet_cubit.dart';



class MyApp extends StatelessWidget {
  final AppRouter appRoutes;
  final String? initialRoute;
  final searchCubit = SearchCubit();
  final homeLayoutCubit = HomeLayoutCubit();

  MyApp({Key? key, required this.appRoutes, required this.initialRoute})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => OnBoardingCubit()),
        BlocProvider(create: (context) => SelectBottomSheetCubit()),
        BlocProvider(create: (context) => HomeCubit(HomeRepository(HomeWebService(UserPrefs())))..onRefresh()),
        BlocProvider(
          create: (context) =>
              LoginCubit(AuthenticationRepository(AuthenticationWebService())),
        ),


        BlocProvider(
          create: (_) => OtpCubit(
            AuthenticationRepository(AuthenticationWebService()),
            UserPrefs(),
          ),
          child: RegisterScreen(),
        ),
        BlocProvider(
          create: (context) =>
              CreatePostCubit(CreatePostRepository(CreatePostWebServices(UserPrefs()))),
        ),
        BlocProvider(
          create: (context) =>
              ResetPasswordCubit(AuthenticationRepository(AuthenticationWebService())),
        ),
        BlocProvider(create: (context) => searchCubit),
        BlocProvider(create: (context) => ProfileCubit(ProfileRepository(ProfileWebService(UserPrefs())))..onRefresh()),
        BlocProvider(create: (context) => homeLayoutCubit),
      ],
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: appRoutes.generateRoute,
          // to make app all support  arabic language
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('ar', ''),
          ],
          initialRoute: initialRoute,
        ),

      ),
    );
  }
}
