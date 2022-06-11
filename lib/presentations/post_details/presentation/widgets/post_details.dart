import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/presentations/home/bloc/home_cubit.dart';
import 'package:lost_app/presentations/post_details/bloc/post_details_cubit.dart';
import 'package:lost_app/presentations/post_details/presentation/widgets/photo_slider.dart';
import 'package:lost_app/shared/components/post_pop_up_menu.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class PostDetails extends StatelessWidget {
  final int postIndex;

  PostDetails({required this.postIndex});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final postDetailsCubit = BlocProvider.of<PostDetailsCubit>(context);
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          color: white,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              top: 5,
              bottom: 15,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: lightBlue,
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 17.0,
                      right: 15,
                      left: 15,
                      bottom: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: size.width >= 500 ? 40 : size.width / 10,
                              height: size.width >= 500 ? 40 : size.width / 10,
                              child: ClipOval(
                                child: Image.network(
                                  postDetailsCubit.post!.userPhoto,
                                  width:
                                      size.width >= 500 ? 40 : size.width / 10,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10.0,
                              ),
                              child: TextClass(
                                text: postDetailsCubit.post!.username,
                                fontSize:
                                    size.width >= 500 ? 20 : size.width / 20,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const Spacer(),
                            if (postDetailsCubit.post!.isOwner)
                              PostPopUpMenu(
                                isPost: true,
                                postId: postDetailsCubit.post!.postId,
                                postIndex: postIndex,
                              ),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        FittedBox(
                          fit: BoxFit.fitWidth,
                          child: TextClass(
                            //text: postDetailsCubit.post!.date,
                            text:  'مفقود  منذ ${postDetailsCubit.post!.date.substring(0,postDetailsCubit.post!.date.length-7)} فى ${postDetailsCubit.post!.personData.address.city}',
                            textAlign: TextAlign.right,
                            fontSize: 15,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextClass(
                              text:
                                  'الاسم : ${postDetailsCubit.post!.personData.personName}',
                              textAlign: TextAlign.right,
                              fontSize: 15,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 2),
                            TextClass(
                              text:
                                  'السن : ${postDetailsCubit.post!.personData.age}',
                              textAlign: TextAlign.right,
                              fontSize: 15,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 2),
                            TextClass(
                              text:
                                  'الجنس : ${postDetailsCubit.post!.personData.gender}',
                              textAlign: TextAlign.right,
                              fontSize: 15,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 2),
                            TextClass(
                              text:
                                  'العنوان : ${"${postDetailsCubit.post!.personData.address.city} - ${postDetailsCubit.post!.personData.address.district}"}',
                              textAlign: TextAlign.right,
                              fontSize: 15,
                              overflow: TextOverflow.ellipsis,
                            ),
                            if (postDetailsCubit
                                    .post!.personData.address.addressDetails !=
                                '')
                              Column(
                                children: [
                                  const SizedBox(height: 2),
                                  TextClass(
                                    text:
                                        'تفاصيل العنوان : ${"${postDetailsCubit.post!.personData.address.city} - ${postDetailsCubit.post!.personData.address.district}"}',
                                    textAlign: TextAlign.right,
                                    fontSize: 15,
                                    overflow: TextOverflow.visible,
                                  ),
                                ],
                              ),
                            const SizedBox(height: 2),
                            TextClass(
                              text:
                                  'هاتف التواصل : ${postDetailsCubit.post!.userPhoneNumber}',
                              textAlign: TextAlign.right,
                              fontSize: 15,
                              overflow: TextOverflow.ellipsis,
                            ),
                            if (postDetailsCubit.post!.details != '')
                              Column(
                                children: [
                                  const SizedBox(height: 2),
                                  TextClass(
                                    text:
                                        'التفاصيل : ${postDetailsCubit.post!.details}',
                                    textAlign: TextAlign.right,
                                    fontSize: 15,
                                    overflow: TextOverflow.visible,
                                  ),
                                ],
                              ),
                            const SizedBox(height: 10),
                          ],
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: 500,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              8.0,
                            ),
                            child: PhotoSlider(
                              images:
                                  postDetailsCubit.post!.personData.extraPhotos,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 2,
                    width: double.infinity,
                    color: white,
                  ),
                  Material(
                    color: lightBlue,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                    child: InkWell(
                      customBorder: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                      onTap: () {
                        log(postIndex.toString());
                        BlocProvider.of<HomeCubit>(context).isSavedPost(
                          postId: postDetailsCubit.post!.postId,
                          postIndex: postIndex,
                        );
                        postDetailsCubit.isSavedPost(
                          postId: postDetailsCubit.post!.postId,
                          postIndex: postIndex,
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Padding(
                                padding: EdgeInsets.only(top: 5.0),
                                child: TextClass(
                                  text: 'حفظ',
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 2.0),
                              child: postDetailsCubit.post!.isSaved
                                  ? const Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    )
                                  : const Icon(Icons.favorite_border),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
