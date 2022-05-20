import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/post/create_post/widgets/add_photo_dialog.dart';
import 'package:lost_app/post/create_post/widgets/delete_photo_dialog.dart';
import 'package:lost_app/post/create_post/widgets/display_photo_dialog.dart';
import 'package:lost_app/post/create_post_cubit/create_post_cubit.dart';

class UploadPictures extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   final createPostCubit=BlocProvider.of<CreatePostCubit>(context);
    return BlocBuilder<CreatePostCubit, CreatePostStates>(
      builder: (context, state) {
        return SizedBox(
          height: 150,
          width: double.infinity,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount:createPostCubit.images.length + 1,
            itemBuilder: (context, index) {
              log(createPostCubit.images.length.toString());
              return index == 0
                  ? InkWell(
                      onTap: () => showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            const AddPhotoDialog(),
                      ),
                      child: Container(
                        width: 80,
                        height: 20.0,
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
                    )
                  : SizedBox(
                      width: 80,
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
                              child: Image.file(
                                File(
                                  createPostCubit.images[index - 1].path,
                                ),
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
        );
      },
    );
  }
}
