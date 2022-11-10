import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lost_app/app/common/data/local/pref/user_pref.dart';
import 'package:lost_app/shared/components/custom_button.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/components/text_form_field_class.dart';
import 'package:lost_app/shared/components/toast.dart';

class ChangePortScreen extends StatelessWidget {
  ChangePortScreen({Key? key}) : super(key: key);
  final urlController = TextEditingController()..text = 'http://';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              children: [
                const SizedBox(height: 30),
                const TextClass(
                  text: 'هل تريد تغيير رابط قاعدة البيانات',
                  fontSize: 25,
                ),
                const SizedBox(height: 10),

                const SizedBox(height: 50),
                //pin code design
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: TextFormFieldClass(
                    textHint: 'new url',
                    controller: urlController,
                  ),
                ),
                const Spacer(),
                CustomButton(
                  onPressed: () async {
                    await UserPrefs().setBaseUrl(urlController.text);
                    showToast(
                        message: 'تم تغيير الرابط بنجاح',
                        state: ToastStates.success,);
                    log(UserPrefs().getBaseUrl());
                  },
                  text: 'تاكيد',
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
