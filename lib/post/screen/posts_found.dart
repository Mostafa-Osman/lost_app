import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/post/create_post_cubit/create_post_cubit.dart';
import 'package:lost_app/post/widgets/create_post_dialog.dart';
import 'package:lost_app/presentations/home/bloc/home_cubit.dart';
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
    final homeCubit = BlocProvider.of<HomeCubit>(context);
    final createPostCubit = BlocProvider.of<CreatePostCubit>(context);
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_sharp, color: black),
        ),
      ),
      body: BlocConsumer<CreatePostCubit, CreatePostState>(
          listener: (context, state) {
        if (state is CreatePostSuccess) {
          homeCubit.homePosts.insert(0, createPostCubit.createPostData);
          navigatorAndFinish(context, RouteConstant.homeLayoutRoute);
        } else if (state is CreatePostError) {
          showToast(
            message: 'حدث خطأ ما حاول مجدداً',
            state: ToastStates.error,
          );
        }
      }, builder: (context, state) {
        // if (state is CreatePostLoading) {
        //   return const Center(
        //     child: CircularProgressIndicator(),
        //   );
        // }
        // else {
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
                            const CreatePostDialog(),
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  PostCard(
                    homePost: createPostCubit.scanDataResults,
                  ),
                ],
              ),
            ),
          ),
        );
      },
          // },
          ),
    );
  }
}
