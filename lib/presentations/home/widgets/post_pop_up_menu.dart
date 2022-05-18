import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/presentations/home/bloc/home_cubit.dart';
import 'package:lost_app/shared/styles/color.dart';

class PostPopUpMenu extends StatelessWidget {
  final int postId;
  final bool navigate;
  PostPopUpMenu({required this.postId, required this.navigate});
  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<HomeCubit>(context);
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: lightBlue,
          ),
          // ignore: deprecated_member_use
          child: PopupMenuButton(
            padding: const EdgeInsets.all(1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            icon: const Icon(
              Icons.more_vert,
              size: 20,
              color: Colors.black,
            ),
            offset: const Offset(0, 35),
            onSelected: (_) {
              Navigator.of(context).pop();
            },
            itemBuilder: (ctx) => [
              PopupMenuItem(
                onTap: (){},
                child: Row(
                  children: const [
                    Icon(
                      Icons.edit,
                      color: Colors.grey,
                      size: 18,
                    ),
                    SizedBox(
                      width: 9.0,
                    ),
                    Text(
                      'تعديل',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              PopupMenuItem(
                onTap: () {
                  homeCubit.deletePost(postId: postId);
                },
                child: Row(
                  children: const [
                    Icon(
                      Icons.delete,
                      color: Colors.grey,
                      size: 18,
                    ),
                    SizedBox(
                      width: 9.0,
                    ),
                    Text(
                      'خذف',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
