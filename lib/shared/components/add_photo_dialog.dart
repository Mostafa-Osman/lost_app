import 'package:flutter/material.dart';
import 'package:lost_app/shared/components/alert_dialog_class.dart';
import 'package:lost_app/shared/components/divider_class.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/styles/color.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AddPhotoDialog extends StatelessWidget {
  final VoidFutureCallBack? onPressedGallery;
  final VoidFutureCallBack? onPressedCamera;

  const AddPhotoDialog({ this.onPressedGallery,  this.onPressedCamera, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialogClass(
      isDoneIcon: false,
      height: 220.0,
      widget: const TextClass(
        text: 'اختر طريقه ادراج الصور',
        fontSize: 15,
      ),
      bottomWidget: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DividerClass(thickness: 1),
            ListTile(
              leading: const Icon(
                Icons.add_photo_alternate_outlined,
              ),
              title: const TextClass(
                text: 'من المعرض',
                textAlign: TextAlign.start,
                fontSize: 12,
                textColor: mainColor,
              ),
              onTap: onPressedGallery,
            ),
            ListTile(
              leading: const Icon(
                Icons.add_a_photo_outlined,
              ),
              title: const TextClass(
                text: 'الكاميرا',
                textAlign: TextAlign.start,
                fontSize: 12,
                textColor: mainColor,
              ),
              onTap: onPressedCamera,
            ),
          ],
        ),
      ),
    );
  }
}
