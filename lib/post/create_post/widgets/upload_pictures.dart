import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lost_app/post/create_post/widgets/add_photo_dialog.dart';
import 'package:lost_app/post/create_post/widgets/delete_photo_dialog.dart';
import 'package:lost_app/post/create_post/widgets/display_photo_dialog.dart';
import 'package:lost_app/post/create_post_cubit/create_post_cubit.dart';

class UploadPictures extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final createPostCubit = BlocProvider.of<CreatePostCubit>(context);
    return BlocBuilder<CreatePostCubit, CreatePostStates>(
      builder: (context, state) {
        return Row(
          children: [
            InkWell(
              onTap: () => showDialog(
                context: context,
                builder: (BuildContext context) => const AddPhotoDialog(),
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
                itemCount: createPostCubit.images.length,
                itemBuilder: (context, index) {
                  log(createPostCubit.images.length.toString());
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
                          child:
                              // SizedBox(
                              //  height: 100.0,
                              //   width: 80,
                              //                 child:  SvgPicture.asset(
                              //                   'assets/images/logo.svg',
                              //                   fit: BoxFit.cover,
                              //                 ),
                              //               ),

                              SizedBox(
                            height: 100.0,
                            width: 80,
                            child: Image.file(
                              File(
                                createPostCubit.images[index].path,
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
            ),
          ],
        );
      },
    );
  }
}
