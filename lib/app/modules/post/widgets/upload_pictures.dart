import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/app/modules/post/create_post_cubit/create_post_cubit.dart';
import 'package:lost_app/app/modules/post/widgets/delete_photo_dialog.dart';
import 'package:lost_app/app/modules/post/widgets/display_photo_dialog.dart';

import 'package:lost_app/shared/components/add_photo_dialog.dart';
import 'package:lost_app/shared/components/constant.dart';

class UploadPictures extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final createPostCubit = BlocProvider.of<CreatePostCubit>(context);
    return BlocBuilder<CreatePostCubit, CreatePostState>(
      builder: (context, state) {
        return Row(
          children: [
            InkWell(
              onTap: () => showDialog(
                context: context,
                builder: (BuildContext context) => AddPhotoDialog(
                  onPressedCamera: () async {
                    createPostCubit.getImageFromCamera(
                      isMainImage: false,
                    );
                    Navigator.pop(context);
                  },
                  onPressedGallery: () async {
                    createPostCubit.getImageFromGallery(
                      isMainImage: false,
                    );
                    Navigator.pop(context);
                  },
                ),
              ),
              child: Container(
                width: 80,
                height: 150.0,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: Icon(
                  Icons.add,
                  size: 30.0,
                  color: Colors.grey[600],
                ),
              ),
            ),
            const SizedBox(width: 10.0),
            SizedBox(
              width: MediaQuery.of(context).size.width - 130,
              height: 150.0,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: createPostCubit.updateExtraImages.isEmpty
                    ? createPostCubit.extraImages.length
                    : createPostCubit.updateExtraImages.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return DisplayPhotoDialog(index: index);
                        },
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 80,
                          height: 20.0,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(10.0),
                              topLeft: Radius.circular(10.0),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return DisplayPhotoDialog(index: index);
                              },
                            );
                          },
                          child: SizedBox(
                            height: 100.0,
                            width: 80,
                            child: createPostCubit.updateExtraImages.isEmpty?
                            Image.file(
                              File(
                                createPostCubit.extraImages[index].path,
                              ),
                              fit: BoxFit.cover,
                            ):Image.network(
                             AppConst.imageUrl+ createPostCubit.updateExtraImages[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  DeletePhotoDialog(index: index),
                            );
                            log('deleted done');
                          },
                          child: Container(
                            width: 80,
                            height: 30.0,
                            padding: const EdgeInsets.only(top: 3.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0),
                              ),
                            ),
                            child: const Icon(
                              Icons.delete,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(width: 10.0);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
