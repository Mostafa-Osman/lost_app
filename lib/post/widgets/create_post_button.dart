import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/post/create_post_cubit/create_post_cubit.dart';
import 'package:lost_app/post/screen/scan_data.dart';
import 'package:lost_app/post/widgets/post_not_found_dialog.dart';
import 'package:lost_app/presentations/home/bloc/home_cubit.dart';
import 'package:lost_app/presentations/route/route_constants.dart';
import 'package:lost_app/shared/components/custom_button.dart';
import 'package:lost_app/shared/components/navigator.dart';
import 'package:lost_app/shared/components/toast.dart';

class CreatePostButton extends StatelessWidget {
  final bool isUpdatePost;

  const CreatePostButton({Key? key, required this.isUpdatePost})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final addPersonDataCubit = BlocProvider.of<CreatePostCubit>(context);
    final homeCubit = BlocProvider.of<HomeCubit>(context);

    return BlocConsumer<CreatePostCubit, CreatePostState>(
      listener: (context, state) {
        if (state is ScanPhotoSuccess) {
          navigateTo(
            context,
            RouteConstant.postsFoundRoute,
          );
        } else if (state is ScanPhotoError &&
            state.error == "لم يتم العثور على أي نتائج") {
          showDialog(
            context: context,
            builder: (
              BuildContext context,
            ) =>
                const PostNotFoundDialog(),
          );
        } else if (state is CreatePostSuccess) {
          homeCubit.addPostInList(post: addPersonDataCubit.createPostData);
          Navigator.pop(context);
          Navigator.pop(context);

        } else if (state is CreatePostError || state is ScanPhotoError) {
          //todo show toast
          // showToast(
          //   message: 'حدث خطأ ما حاول مجدداً',
          //   state: ToastStates.error,
          // );
          //todo remove it
          showDialog(
              context: context,
              builder: (
                BuildContext context,
              ) =>
                  const PostNotFoundDialog(),);
        }
      },
      builder: (context, state) {
        if (state is ScanPhotoLoading) {
          return ScanScreen();
        } else if (state is CreatePostLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Positioned(
            bottom: 0.0,
            right: 0.0,
            left: 0.0,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      onPressed: () {
                        if (addPersonDataCubit.nameFormKey.currentState!
                            .validate()) {
                          if (addPersonDataCubit.getErrorMessage() == 'done') {
                            //todo mansour will change null and sent request to server with new data
                            if (isUpdatePost) {
                              return null;
                            } else {
                              addPersonDataCubit.scanMainPhoto(
                                isLost: addPersonDataCubit.isLost,
                                mainPhoto: addPersonDataCubit.mainImage!,
                              );
                            }
                          } else {
                            showToast(
                              message: addPersonDataCubit.getErrorMessage(),
                              state: ToastStates.warning,
                            );
                          }
                        }
                      },
                      text: isUpdatePost ? 'حفظ التغيرات' : "بحث",
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  Expanded(
                    child: CustomButton(
                      onPressed: () {
                        addPersonDataCubit.resetForm();
                      },
                      text: "افراغ الحقول",
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
