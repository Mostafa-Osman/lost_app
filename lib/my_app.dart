import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lost_app/authentication/data/repository/authentication_repository.dart';
import 'package:lost_app/authentication/data/web_services/authentication_web_service.dart';
import 'package:lost_app/authentication/presentation/forget_password/reset_password_cubit/reset_password_cubit.dart';
import 'package:lost_app/authentication/presentation/login/login_cubit/login_cubit.dart';
import 'package:lost_app/authentication/presentation/otp/otp_cubit/otp_cubit.dart';
import 'package:lost_app/authentication/presentation/register/screen/register_screen.dart';
import 'package:lost_app/data/local/pref/user_pref.dart';
import 'package:lost_app/presentations/home_layout/home_layout_cubit/home_cubit.dart';
import 'package:lost_app/presentations/on_boarding/on_boarding_cubit/on_boarding_cubit.dart';
import 'package:lost_app/presentations/route/router.dart';
import 'package:lost_app/presentations/search/search_cubit/search_cubit.dart';



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
        // BlocProvider(create: (context) => HomeCubit(HomeRepository(HomeWebService()))..getHomeData()),
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
              ResetPasswordCubit(AuthenticationRepository(AuthenticationWebService())),
        ),
        BlocProvider(create: (context) => searchCubit),
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
