import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/presentations/home/bloc/home_cubit.dart';
import 'package:lost_app/presentations/home/widgets/post_details.dart';
import 'package:lost_app/shared/components/comment_card.dart';
import 'package:lost_app/shared/components/text_form_field_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class PostDetailsScreen extends StatelessWidget {
  final bool autofocus;
  final TextEditingController commentController = TextEditingController();
  final int postId;

  PostDetailsScreen({required this.autofocus, required this.postId});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeDeleteSuccessState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
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
          body: state is HomeLoadingState
              ? const Center(child: CircularProgressIndicator())
              : Container(
                  color: white,
                  child: Stack(
                    children: [
                      Align(
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            PostDetails(),
                            const CommentCard(),
                            const SizedBox(height: 100),
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
                                        padding:
                                            const EdgeInsets.only(right: 4.0),
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
                ),
        );
      },
    );
  }
}
