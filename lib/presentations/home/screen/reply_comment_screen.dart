import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/data/models/home/post_model.dart';
import 'package:lost_app/presentations/home/bloc/home_cubit.dart';
import 'package:lost_app/shared/components/comment_card.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/components/text_form_field_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class ReplyCommentScreen extends StatelessWidget {
  final TextEditingController commentController = TextEditingController();
  final bool autofocus;
  final int postId;
  final int commentIndex;
  final int postIndex;
  final int parentCommentId;
  final int parentCommentIndex;

  ReplyCommentScreen({
    required this.autofocus,
    required this.postId,
    required this.postIndex,
    required this.commentIndex,
    this.parentCommentId = 0,
    this.parentCommentIndex = -1,
  });

  @override
  Widget build(BuildContext context) {
   BlocProvider.of<HomeCubit>(context).getPostData(postId);
   final comment =  BlocProvider.of<HomeCubit>(context).post!.comments;
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: TextClass(
            text: 'الردود',
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_sharp, color: black),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: white,
        elevation: 0,
      ),
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Container(
              color: white,
              child: Stack(
                children: [
                  Align(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height - 100,
                      width: double.infinity,
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          CommentCard(
                            replyButton: false,
                            reply: false,
                            mainComment: comment[commentIndex],
                            postId: postId,
                            postIndex: postIndex,
                            commentIndex: commentIndex,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 10),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return CommentCard(
                                  replyButton: false,
                                  reply: true,
                                  replyComment: comment[commentIndex].replies?[index],
                                  postId: postId,
                                  postIndex: postIndex,
                                  commentIndex: index,
                                  parentCommentId: comment[commentIndex].commentId,
                                  parentCommentIndex: commentIndex,
                                );
                              },
                              itemCount: comment[commentIndex].replies!.length,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 80,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: white,
                        boxShadow: [
                          BoxShadow(
                            color: grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(right: 15, left: 15),
                              child: TextFormFieldClass(
                                autofocus: autofocus,
                                controller: commentController,
                                roundedRectangleBorder: 6,
                                textHint: 'اكتب تعليقا ...',
                                prefix: Transform(
                                  alignment: Alignment.center,
                                  transform: Matrix4.rotationY(math.pi),
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 4.0),
                                    child: IconButton(
                                      icon: const Icon(Icons.send_rounded),
                                      iconSize: 30.0,
                                      color: bottomNavBarBlue,
                                      onPressed: () {},
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
