import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/post/create_post_cubit/create_post_cubit.dart';
import 'package:lost_app/presentations/home/bloc/home_cubit.dart';
import 'package:lost_app/presentations/post_details/bloc/post_details_cubit.dart';
import 'package:lost_app/presentations/profile/bloc/profile_cubit.dart';
import 'package:lost_app/presentations/route/route_constants.dart';
import 'package:lost_app/shared/components/navigator.dart';
import 'package:lost_app/shared/styles/color.dart';

import '../../presentations/home/data/Home_model/home_model.dart';

class PostPopUpMenu extends StatelessWidget {
  final bool isPost;
  final int postId;
  final int postIndex;
  int commentId;
  int commentIndex;
  int parentCommentId;
  int parentCommentIndex;
  String commentText;

  PostPopUpMenu({
    required this.isPost,
    required this.postId,
    required this.postIndex,
    this.commentId = 0,
    this.commentIndex = -1,
    this.parentCommentId = 0,
    this.parentCommentIndex = -1,
    this.commentText = '',
  });

  @override
  Widget build(BuildContext context) {
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
            onTap: () {
              if (isPost) {
                log('hello');
                BlocProvider.of<CreatePostCubit>(context)
                    .setUpdateData(BlocProvider.of<PostDetailsCubit>(context).post!)
                    .then(
                      (value) async {
                       /* final postDetails= */ navigateWithArgument(
                          context, RouteConstant.createPostRoute, [
                        if (BlocProvider.of<PostDetailsCubit>(context)
                            .post!
                            .isLost)
                          'مكان الفقدان'
                        else
                          'مكان العثور',
                        'update-Post'
                      ])/* as HomePost?*/ ;
                       /* if(postDetails!=null){
                          BlocProvider.of<PostDetailsCubit>(context).setUpdateData(postDetails);
                        }*/
                      },
                    );
              } else {
                BlocProvider.of<PostDetailsCubit>(context).emitEditComment(
                  comment: commentText,
                  postId: postId,
                  commentId: commentId,
                  commentIndex: commentIndex,
                  parentCommentId: parentCommentId,
                  parentCommentIndex: parentCommentIndex,
                );
              }
            },
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
              if (isPost) {
                BlocProvider.of<HomeCubit>(context)
                    .deletePost(postId: postId)
                    .then((value) {
                  BlocProvider.of<PostDetailsCubit>(context)
                      .emitNavigatorPop(pop: value);
                });
                BlocProvider.of<ProfileCubit>(context).removePost(postId);
              } else {
                BlocProvider.of<PostDetailsCubit>(context).deleteComment(
                  postId: postId,
                  commentId: commentId,
                  commentIndex: commentIndex,
                  parentCommentId: parentCommentId,
                  parentCommentIndex: parentCommentIndex,
                );
              }
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
  }
}
