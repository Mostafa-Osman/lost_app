import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/post/create_post_cubit/create_post_cubit.dart';
import 'package:lost_app/shared/components/alert_dialog_class.dart';
import 'package:lost_app/shared/components/text_button_class.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class DeletePhotoDialog extends StatelessWidget {
  const DeletePhotoDialog({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    final addPersonDataCubit = BlocProvider.of<CreatePostCubit>(context);
    return AlertDialogClass(
      height: 200,
      widget: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(
              top: 20.0,
              right: 20.0,
              left: 20.0,
              bottom: 70,
            ),
            child: TextClass(
              text: 'حذف الصوره ؟',
              fontSize: 20,
              textColor: Colors.red,
            ),
          ),
          Container(
            height: 2,
            color: const Color.fromRGBO(200, 218, 245, 1),
          ),
        ],
      ),
      bottomWidget: Row(
        children: [
          Expanded(
            child: TextButtonClass(
              text: 'لا',
              fontSize: 18,
              textColor: lightGrey,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Container(
            width: 2,
            color: const Color.fromRGBO(200, 218, 245, 1),
          ),
          Expanded(
            child: TextButtonClass(
              text: 'نعم',
              fontSize: 18,
              textColor: mainColor,
              onPressed: () {
                addPersonDataCubit.deletePhoto(
                  index: index ,
                );
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
      isDoneIcon: false,
    );
  }
}
