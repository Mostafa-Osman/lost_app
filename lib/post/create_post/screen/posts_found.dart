import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/post/create_post/widgets/add_post_dialog.dart';
import 'package:lost_app/post/create_post_cubit/create_post_cubit.dart';
import 'package:lost_app/presentations/route/route_constants.dart';
import 'package:lost_app/shared/components/navigator.dart';
import 'package:lost_app/shared/components/post_card.dart';
import 'package:lost_app/shared/components/text_button_class.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/components/toast.dart';
import 'package:lost_app/shared/styles/color.dart';

class PostsFoundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        leading: IconButton(
          onPressed: () =>
              navigatorAndFinish(context, RouteConstant.homeLayoutRoute),
          icon: const Icon(Icons.arrow_back_ios_sharp, color: black),
        ),
      ),
      body: BlocConsumer<CreatePostCubit, CreatePostState>(
        listener: (context, state) {
          if (state is CreatePostError) {
            showToast(
              message: 'حدث خطأ ما حاول مجداً',
              state: ToastStates.error,
            );
          } else if (state is CreatePostSuccess) {
            navigatorAndFinish(context, RouteConstant.homeLayoutRoute);
          }
        },
        builder: (context, state) {
          if (state is CreatePostLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      const TextClass(text: 'تهانينا', fontSize: 25),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 10.0,
                          left: 10.0,
                          top: 20,
                        ),
                        child: TextClass(
                          text:
                              'لقد عثرنا علي(بعض/احد) المنشورات تتطابق مع البيانات التي ادحلتها',
                          textColor: lightGrey,
                          fontSize: 15,
                        ),
                      ),
                      TextButtonClass(
                        text: 'اليس كذالك ؟',
                        textColor: mainColor,
                        fontSize: 18,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (
                              BuildContext context,
                            ) =>
                                const AddPostDialog(),
                          );
                        },
                      ),
                      const SizedBox(height: 30),
                     // PostCard(),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
