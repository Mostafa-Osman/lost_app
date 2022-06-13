import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lost_app/post/create_post_cubit/create_post_cubit.dart';
import 'package:lost_app/presentations/route/route_constants.dart';
import 'package:lost_app/shared/components/navigator.dart';
import 'package:lost_app/shared/components/text_class.dart';

class CardPostPage extends StatelessWidget {
  final String image;
  final String text;
  final double? size;
  final String? optionText;

  const CardPostPage({
    required this.image,
    required this.text,
    this.optionText,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 310,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Card(
        elevation: 6,
        child: InkWell(
          onTap: () {
            BlocProvider.of<CreatePostCubit>(context).resetForm();
            BlocProvider.of<CreatePostCubit>(context)
                .setIsLost(optionText: optionText!);
            navigateWithArgument(
              context,
              RouteConstant.createPostRoute,
              [optionText, 'create-post'],
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(
                  image,
                  fit: BoxFit.fitWidth,
                  width: size,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                child: TextClass(text: text),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
