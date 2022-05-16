import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lost_app/authentication/presentation/register/widgets/register_form.dart';
import 'package:lost_app/authentication/presentation/register/widgets/submit_button.dart';
import 'package:lost_app/presentations/route/route_constants.dart';
import 'package:lost_app/shared/components/navigator.dart';
import 'package:lost_app/shared/components/text_button_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    height: 150,
                    width: double.infinity,
                    child: SvgPicture.asset('assets/images/logo.svg'),
                  ),
                ),
                const RegisterForm(),
                const SizedBox(height: 30),
                const SubmitButton(),
                const SizedBox(height: 10),
                TextButtonClass(
                  onPressed: () =>
                      navigatorAndFinish(
                    context,
                    RouteConstant.loginRoute,
                  ),
                  text: 'هل لديك حساب بالفعل ؟',
                  textColor: mainColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
