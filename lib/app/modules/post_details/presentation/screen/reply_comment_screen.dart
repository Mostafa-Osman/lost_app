import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/app/modules/post_details/bloc/post_details_cubit.dart';
import 'package:lost_app/shared/components/alert_dialog_class.dart';
import 'package:lost_app/shared/components/comment_card.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/components/text_form_field_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class ReplyCommentScreen extends StatelessWidget {
  final TextEditingController commentController = TextEditingController();
  TextEditingController editCommentController = TextEditingController();
  final ScrollController _controller = ScrollController();

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
   BlocProvider.of<PostDetailsCubit>(context).getPostData(postId);
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
      body: BlocConsumer<PostDetailsCubit, PostDetailsState>(
        listener: (context, state) {
          if (state is PostDetailsDeleteCommentSuccessState) {
            Navigator.pop(context);
          }
          if (_controller.hasClients) {
            if (state is PostCommentLoadingState) {
              SchedulerBinding.instance.addPostFrameCallback((_) {
                _controller.animateTo(
                  _controller.position.maxScrollExtent,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.fastOutSlowIn,
                );
              });
            }
          }
          if (state is PostDetailsEmitEditCommentDialogState) {
            editCommentController.text = state.comment;
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialogClass(
                  height: 200,
                  isDoneIcon: false,
                  widget: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      controller: editCommentController,
                      keyboardType: TextInputType.text,
                      maxLines: 5,
                      style: const TextStyle(
                        overflow: TextOverflow.visible,
                      ),
                      onSubmitted: (value) {
                        BlocProvider.of<PostDetailsCubit>(context).updateComment(
                          comment: value,
                          postId: state.postId,
                          commentId: state.commentId,
                          commentIndex: state.commentIndex,
                          parentCommentId: state.parentCommentId,
                          parentCommentIndex: state.parentCommentIndex,
                        );
                        Navigator.pop(context);
                      },
                    ),
                  ),
                );

              },
            );
          }
        },
        builder: (context, state) {
          //final comment =  BlocProvider.of<HomeCubit>(context);
          if (state is PostDetailsLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          else {
            return ColoredBox(
              color: white,
              child: Stack(
                children: [
                  Align(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height - 100,
                      width: double.infinity,
                      child: ListView(
                        shrinkWrap: true,
                        controller: _controller,
                        children: [
                          CommentCard(
                            replyButton: false,
                            reply: false,
                            mainComment: BlocProvider.of<PostDetailsCubit>(context).post!.comments[commentIndex],
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
                                  replyComment: BlocProvider.of<PostDetailsCubit>(context).post!.comments[commentIndex].replies?[index],
                                  postId: postId,
                                  postIndex: postIndex,
                                  commentIndex: index,
                                  parentCommentId: BlocProvider.of<PostDetailsCubit>(context).post!.comments[commentIndex].commentId!,
                                  parentCommentIndex: commentIndex,
                                );
                              },
                              itemCount: BlocProvider.of<PostDetailsCubit>(context).post!.comments[commentIndex].replies!.length,
                            ),
                          ),
                          if (state is PostCommentLoadingState)
                            Padding(
                              padding: const EdgeInsets.only(left: 40, top: 20, right: 20),
                              child: Container(
                                height: 110,
                                decoration: BoxDecoration(
                                  color: lightBlue,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(15),),
                                ),
                                child: const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                            ),
                          const SizedBox(height: 200),
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
                                      onPressed: () {
                                        if (commentController.text.isNotEmpty) {
                                          BlocProvider.of<PostDetailsCubit>(context).createComment(
                                            reply: true,
                                            postId: postId,
                                            parentCommentIndex: commentIndex,
                                            parentCommentId: parentCommentId,
                                            content: commentController.text,
                                          );
                                          commentController.clear();
                                        }
                                      },
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
