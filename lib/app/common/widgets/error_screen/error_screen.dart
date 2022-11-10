
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/app/common/extensions/context_extensions.dart';
import 'package:lost_app/app/common/themes/app_colors.dart';
import 'package:lost_app/app/common/themes/app_theme.dart';
import 'package:lost_app/app/common/widgets/app_bar/no_app_bar.dart';
import 'package:lost_app/app/common/widgets/default_app_button.dart';
import 'package:lost_app/app/common/widgets/error_screen/cubit/error_cubit.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class ErrorScreen extends StatelessWidget {
  final VoidCallback? onRetrySuccess;
  late final ConnectivityError errorType;
  VoidCallback? onLogoutPressed;

  ErrorScreen({
    this.onRetrySuccess,
    bool isInternetError = false,
    this.onLogoutPressed,
  }) {
    errorType = isInternetError
        ? ConnectivityError.internetError
        : ConnectivityError.dataError;
  }

  ErrorScreen.internetError({
    required this.onRetrySuccess,
  }) {
    errorType = ConnectivityError.internetError;
    onLogoutPressed = null;
  }

  ErrorScreen.dataError({
    this.onRetrySuccess,
    this.onLogoutPressed,
  }) {
    errorType = ConnectivityError.dataError;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NoAppBar(),
      body: ErrorCubitProvider(
        builder: (context, state) {
          // final errorCubit = context.read<ErrorCubit>();
          return Column(
            children: [
              if (onLogoutPressed != null)
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0, right: 20),
                    child: InkWell(
                      onTap: onLogoutPressed,
                      child: const Text(
                        'logout',
                        style: TextStyle(
                          color: AppTheme.redColor,
                        ),
                      ),
                    ),
                  ),
                ),
              const Spacer(),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  Lottie.asset(
                    errorType == ConnectivityError.internetError
                        ? 'assets/lottie/connection_error.json'
                        : 'assets/lottie/error_404.json',
                    width: errorType == ConnectivityError.internetError
                        ? context.width
                        : context.width * 0.7,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    errorType == ConnectivityError.dataError
                        ? '${'data_error'}\n${'try_again_later'}'
                        : 'no_internet_connection',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      color: AppColors.veryDarkGray,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 30),
                  if (onRetrySuccess != null) ...[
                    const SizedBox(height: 10),
                    DefaultAppButton(
                      isLoading: state is ErrorLoading,
                      buttonColor: Theme.of(context).primaryColor,
                      onPress: () async {
                        //todo handle it
                        // if (errorType == ConnectivityError.dataError ||
                        //     await errorCubit.isProblemSolved(errorType)) {
                        //   onRetrySuccess!.call();
                        // }
                      },
                      width: context.width - 100,
                      title: 'try_again',
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                    )
                  ],
                ],
              ),
              const Spacer(),
            ],
          );
        },
      ),
    );
  }
}

class ErrorCubitProvider extends StatelessWidget {
  final Widget Function(BuildContext context, ErrorScreenState state) builder;

  const ErrorCubitProvider({
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ErrorCubit(),
      child: SizedBox.expand(
        child: BlocBuilder<ErrorCubit, ErrorScreenState>(
          builder: builder,
        ),
      ),
    );
  }
}
