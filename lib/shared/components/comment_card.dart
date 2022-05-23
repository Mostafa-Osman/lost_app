import 'package:flutter/material.dart';
import 'package:lost_app/presentations/home/widgets/post_pop_up_menu.dart';
import 'package:lost_app/presentations/route/route_constants.dart';
import 'package:lost_app/shared/components/navigator.dart';
import 'package:lost_app/shared/components/text_button_class.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class CommentCard extends StatelessWidget {
  final bool reply;
  final String userName;
  final String date;
  final bool isOwner;
  final String userImage;
  final String comment;
  final int postId;
  final int commentIndex;
  final int postIndex;
  final int parentCommentId;
  final int parentCommentIndex;
  final int commentId;
  final int replayNum;

  CommentCard({
    this.reply = false,
    required this.userName,
    required this.date,
    required this.isOwner,
    required this.userImage,
    required this.postId,
    required this.postIndex,
    required this.comment,
    required this.commentId,
    this.replayNum = 0,
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
                        userImage,
                        width: size.width >= 500 ? 40 : size.width / 10,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextClass(
                            text: userName,
                            textAlign: TextAlign.start,
                          ),
                          TextClass(
                            text: date,
                            fontSize: 12,
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  if (isOwner)
                    PostPopUpMenu(
                      isPost: false,
                      postId: postId,
                      postIndex: postId,
                      commentId: commentId,
                      commentIndex: commentIndex,
                      parentCommentId: parentCommentId,
                      parentCommentIndex: parentCommentIndex,
                      commentText: comment,
                    ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const SizedBox(width: 50),
                  Expanded(
                    child: TextClass(
                      text: comment,
                      fontSize: size.width >= 500 ? 20 : size.width / 24,
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
              if (!reply)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextButtonClass(
                      text: 'الرد',
                      onPressed: () => reply
                          ? null
                          : navigateWithArgument(
                              context,
                              RouteConstant.replyCommentRoute,
                              true,
                            ),
                      fontSize: 12,
                    ),
                    TextButtonClass(
                      text: 'الردود ($replayNum)',
                      onPressed: () => reply
                          ? null
                          : navigateWithArgument(
                              context,
                              RouteConstant.replyCommentRoute,
                              false,
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
