import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lost_app/app/modules/post/create_post_cubit/create_post_cubit.dart';
import 'package:lost_app/shared/components/add_photo_dialog.dart';
import 'package:lost_app/shared/components/constant.dart';

class AddMainPhoto extends StatelessWidget {
  const AddMainPhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final createPostCubit = BlocProvider.of<CreatePostCubit>(context);

    return BlocBuilder<CreatePostCubit, CreatePostState>(
      builder: (context, state) {
        return Center(
          child:
          createPostCubit.mainImage == null &&
                      !createPostCubit.isUpdatePost ||
                  createPostCubit.updateMainPhoto == '' &&
                      createPostCubit.isUpdatePost
              ? InkWell(
                  onTap: () => showDialog(
                    context: context,
                    builder: (BuildContext context) => AddPhotoDialog(
                      onPressedCamera: () async {
                        createPostCubit.getImageFromCamera(
                          isMainImage: true,
                        );
                        Navigator.pop(context);
                      },
                      onPressedGallery: () async {
                        createPostCubit.getImageFromGallery(
                          isMainImage: true,
                        );
                        Navigator.pop(context);
                      },
                    ),
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
                )
              : Stack(
                  children: [
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: ClipOval(
                        child: (createPostCubit.mainImage == null)
                            ? Image.network(
                                AppConst.imageUrl +
                                    createPostCubit.updateMainPhoto,
                                fit: BoxFit.cover,
                                height: 120,
                                width: 120,
                              )
                            : Image.file(
                                createPostCubit.mainImage!,
                                fit: BoxFit.cover,
                                height: 120,
                                width: 120,
                              ),
                      ),
                    ),
                    Positioned(
                      bottom: 0.0,
                      right: 0.0,
                      child: InkWell(
                        onTap: () => showDialog(
                          context: context,
                          builder: (BuildContext context) => AddPhotoDialog(
                            onPressedCamera: () async {
                              createPostCubit.getImageFromCamera(
                                isMainImage: true,
                              );
                              Navigator.pop(context);
                            },
                            onPressedGallery: () async {
                              createPostCubit.getImageFromGallery(
                                isMainImage: true,
                              );
                              Navigator.pop(context);
                            },
                          ),
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
