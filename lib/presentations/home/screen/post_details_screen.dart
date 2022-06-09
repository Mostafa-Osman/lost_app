import 'dart:developer';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/presentations/home/bloc/home_cubit.dart';
import 'package:lost_app/presentations/home/widgets/post_details.dart';
import 'package:lost_app/shared/components/comment_card.dart';
import 'package:lost_app/shared/components/text_form_field_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class PostDetailsScreen extends StatelessWidget {
  final bool autofocus;
  final int postId;
  final int postIndex;
  TextEditingController commentController = TextEditingController();
  TextEditingController editeCommentController = TextEditingController();

  final ScrollController _controller = ScrollController();

  PostDetailsScreen({
    required this.autofocus,
    required this.postId,
    required this.postIndex,
  });

  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<HomeCubit>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_sharp, color: black),
        ),
        iconTheme: const IconThemeData(
          color: black,
          //change your color here
        ),
      ),
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is HomeDeletePostSuccessState) {
            Navigator.pop(context);
          }
          if (_controller.hasClients) {
            if (state is PostCommentLoadingState) {
              SchedulerBinding.instance?.addPostFrameCallback((_) {
                _controller.animateTo(
                  _controller.position.maxScrollExtent,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.fastOutSlowIn,
                );
              });
            }
          }
          if (state is HomeEmitEditCommentDialogState) {
            editeCommentController.text = state.comment;
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        controller: editeCommentController,
                        keyboardType: TextInputType.text,
                        maxLines: 5,
                        style: const TextStyle(
                          overflow: TextOverflow.visible,
                        ),
                        onSubmitted: (value) {
                          homeCubit.updateComment(
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
                  ),
                );
              },
            );
          }
        },
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else {
            log(_controller.toString());
            return Container(
              color: white,
              child: Stack(
                children: [
                  Align(
                    child: ListView(
                      shrinkWrap: true,
                      controller: _controller,
                      children: [
                        PostDetails(postIndex: postIndex),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: homeCubit.post!.comments.length,
                          itemBuilder: (context, index) {
                            final comment = homeCubit.post!.comments[index];
                            return CommentCard(
                              reply: false,
                              mainComment: comment,
                              postId: postId,
                              postIndex: postIndex,
                              commentIndex: index,
                            );
                          },
                        ),
                        if (state is PostCommentLoadingState)
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 20.0,
                                right: 20.0,
                                top: 20,
                                bottom: 15,
                              ),
                              child: Container(
                                height: 130,
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
                          ),
                        const SizedBox(height: 200),
                      ],
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
                              padding: const EdgeInsets.only(
                                right: 15,
                                left: 15,
                              ),
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
                                          homeCubit.createComment(
                                            postId: postId,
                                            parentCommentId: 0,
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
