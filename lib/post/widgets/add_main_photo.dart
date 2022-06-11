import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lost_app/post/widgets/add_photo_dialog.dart';
import 'package:lost_app/post/create_post_cubit/create_post_cubit.dart';

class AddMainPhoto extends StatelessWidget {
  const AddMainPhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final createPostCubit = BlocProvider.of<CreatePostCubit>(context);

    return BlocBuilder<CreatePostCubit, CreatePostState>(
      builder: (context, state) {
        return Center(
          child: createPostCubit.mainImage == null ? InkWell(
            onTap: () =>
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                  const AddPhotoDialog(isMainPhoto: true,),
                ),
            child: Container(
              height: 120.0,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.add,
                size: 30.0,
                color: Colors.grey[600],
              ),
            ),
          ) : Stack(
            children: [
              FittedBox(
                fit: BoxFit.fitWidth,
                child: ClipOval(
                  child: Image.file(
                    createPostCubit.mainImage!,
                    height: 120,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 0.0,
                right: 0.0,
                child: InkWell(
                  onTap: () =>
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                        const AddPhotoDialog(isMainPhoto: true,),
                      ),
                  child: SvgPicture.asset(
                    'assets/icons/add_icon.svg',
                    height: 30,
                    width: 30,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

            ],
          ),
        );
      },
    );
  }
}
