import 'package:flutter/material.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/styles/color.dart';
import 'package:lottie/lottie.dart';

class ScanScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/lottie/processing.json', fit: BoxFit.fitWidth,),
            const TextClass(text: 'برجاء الانتظار', fontSize: 22,),
            const SizedBox(height: 40),
            const  TextClass(text: 'نقوم بتحليل الصورة ومن ثم البحث في', textColor: grey,),
            const  TextClass(text: 'قاعدة البيانات التي تحتوي على العديد من', textColor: grey,),
            const  TextClass(text: 'الصور لاشخاص مفقودين', textColor: grey,),
          ],
        ),
      ),
    );
  }
}
