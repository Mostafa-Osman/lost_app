import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/post/create_post_cubit/create_post_cubit.dart';
import 'package:lost_app/presentations/route/route_constants.dart';
import 'package:lost_app/shared/components/custom_button.dart';
import 'package:lost_app/shared/components/navigator.dart';
import 'package:lost_app/shared/components/toast.dart';

class BottomNavBar extends StatelessWidget {
  final bool isUpdatePost;

  const BottomNavBar({Key? key, required this.isUpdatePost}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final addPersonDataCubit = BlocProvider.of<CreatePostCubit>(context);
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
                  if (addPersonDataCubit.nameFormKey.currentState!.validate()) {
                    if (addPersonDataCubit.getErrorMessage() == 'done') {
                      //todo mansour will change null and sent request to server with new data
                      if (isUpdatePost) {
                        return;
                      } else {
                        //todo navigate to scanScreen when khedr finish
                        //  navigateTo(context, RouteConstant.scanDataRoute);
                        //todo khedr use code ai here
                        navigateTo(context, RouteConstant.postsFoundRoute);
                        //todo delete it when khedr finish
                        navigateTo(context, RouteConstant.postsFoundRoute);
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
}
