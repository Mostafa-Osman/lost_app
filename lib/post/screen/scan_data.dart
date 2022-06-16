import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/post/create_post_cubit/create_post_cubit.dart';
import 'package:lost_app/post/widgets/post_not_found_dialog.dart';
import 'package:lost_app/presentations/route/route_constants.dart';
import 'package:lost_app/shared/components/navigator.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/components/toast.dart';
import 'package:lost_app/shared/styles/color.dart';
import 'package:lottie/lottie.dart';

class ScanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CreatePostCubit, CreatePostState>(
        listener: (context, state) {
          if (state is ScanPhotoSuccess) {
            navigateTo(
              context,
              RouteConstant.postsFoundRoute,
            );
          }
         else if (state is ScanPhotoError &&
              state.error == "لم يتم العثور على أي نتائج") {
            Navigator.pop(context);

            showDialog(
              context: context,
              builder: (
                  BuildContext context,
                  ) =>
              const PostNotFoundDialog(),
            );
          }
        },
        builder: (context, state) {
          return SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  'assets/lottie/processing.json',
                  fit: BoxFit.fitWidth,
                ),
                const TextClass(
                  text: 'برجاء الانتظار',
                  fontSize: 22,
                ),
                const SizedBox(height: 40),
                const TextClass(
                  text: 'نقوم بتحليل الصورة ومن ثم البحث في',
                  textColor: grey,
                ),
                const TextClass(
                  text: 'قاعدة البيانات التي تحتوي على العديد من',
                  textColor: grey,
                ),
                const TextClass(
                  text: 'الصور لاشخاص مفقودين',
                  textColor: grey,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
