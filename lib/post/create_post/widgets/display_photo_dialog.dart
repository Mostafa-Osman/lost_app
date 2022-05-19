import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/post/create_post_cubit/create_post_cubit.dart';

class DisplayPhotoDialog extends StatelessWidget {
  const DisplayPhotoDialog({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    final addPersonDataCubit = BlocProvider.of<CreatePostCubit>(context);

    return SizedBox(
      child: Image.file(
        File(
          addPersonDataCubit.imageCamera[index - 1].path,
        ),
        fit: BoxFit.cover,
      ),
    );
  }
}
