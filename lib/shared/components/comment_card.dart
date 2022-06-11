import 'package:flutter/material.dart';
import 'package:lost_app/presentations/post_details/data/post_details_model/post_model.dart';
import 'package:lost_app/shared/components/post_pop_up_menu.dart';
import 'package:lost_app/presentations/route/route_constants.dart';
import 'package:lost_app/shared/components/navigator.dart';
import 'package:lost_app/shared/components/text_button_class.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class CommentCard extends StatelessWidget {
  Comments? mainComment;
  Replies? replyComment;
  final bool reply;
  final bool replyButton;
  final int postId;
  final int postIndex;
  final int commentIndex;
  int parentCommentId;
  int parentCommentIndex;

  CommentCard({
    this.replyButton = true,
    required this.reply,
    this.mainComment,
    this.replyComment,
    required this.postId,
    required this.postIndex,
    required this.commentIndex,
    this.parentCommentId = 0,
    this.parentCommentIndex = -1,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      child: Container(
        decoration: BoxDecoration(
          color: lightBlue,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: size.width >= 500 ? 40 : size.width / 10,
                    height: size.width >= 500 ? 40 : size.width / 10,
                    child: ClipOval(
                      child: Image.network(
                        reply
                            ? replyComment?.photo ?? ''
                            : mainComment?.photo ?? '',
                        width: size.width >= 500 ? 40 : size.width / 10,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextClass(
                          text: reply
                              ? replyComment?.username ?? ''
                              : mainComment?.username ?? '',
                          textAlign: TextAlign.start,
                        ),
                        TextClass(
                          text: reply
                              ? replyComment?.date.substring(
                                    0,
                                    replyComment!.date.length - 7,
                                  ) ??
                                  ''
                              : mainComment?.date.substring(
                                    0,
                                    mainComment!.date.length - 7,
                                  ) ??
                                  '',
                          fontSize: 12,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  if (reply
                      ? replyComment?.isOwner ?? false
                      : mainComment?.isOwner ?? false)
                    PostPopUpMenu(
                      isPost: false,
                      postId: postId,
                      postIndex: postIndex,
                      commentId: reply
                          ? replyComment?.commentId ?? 0
                          : mainComment?.commentId ?? 0,
                      commentIndex: commentIndex,
                      parentCommentId: parentCommentId,
                      parentCommentIndex: parentCommentIndex,
                      commentText: reply
                          ? replyComment?.content ?? ''
                          : mainComment?.content ?? '',
                    ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const SizedBox(width: 50),
                  Expanded(
                    child: TextClass(
                      text: reply
                          ? replyComment?.content ?? ''
                          : mainComment?.content ?? '',
                      fontSize: size.width >= 500 ? 20 : size.width / 24,
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
              if (replyButton)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextButtonClass(
                      text: 'الرد',
                      onPressed: () => reply
                          ? null
                          : navigateWithArgument(
                              context, RouteConstant.replyCommentRoute, {
                              'autofocus': true,
                              'postId': postId,
                              'commentIndex': commentIndex,
                              'postIndex': postIndex,
                              'parentCommentId': parentCommentId,
                              'parentCommentIndex': parentCommentIndex,
                            }),
                      fontSize: 12,
                    ),
                    TextButtonClass(
                      text: 'الردود (${mainComment!.replies!.length})',
                      onPressed: () => reply
                          ? null
                          : navigateWithArgument(
                              context,
                              RouteConstant.replyCommentRoute,
                              {
                                'autofocus': false,
                                'postId': postId,
                                'commentIndex': commentIndex,
                                'postIndex': postIndex,
                                'parentCommentId': parentCommentId,
                                'parentCommentIndex': parentCommentIndex,
                              },
                            ),
                      fontSize: 12,
                    ),
                  ],
                )
              else
                const SizedBox(
                  height: 20,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
