import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lost_app/modules/add_person_data/add_person_cubit/add_person_cubit.dart';
import 'package:lost_app/shared/components/alert_dialog_class.dart';
import 'package:lost_app/shared/components/divider_class.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class UploadPictures extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        //add photos
        const Padding(
          padding: EdgeInsets.only(top: 40.0, bottom: 20),
          child: TextClass(
            textAlign: TextAlign.start,
            text: 'اضافه صوره او اكثر',
            fontSize: 25,
          ),
        ),
        SizedBox(
          height: 180,
          width: double.infinity,
          child: (AddPersonDataCubit.get(context).imageCamera.isEmpty)
              ? Center(child: addPicture('assets/images/osman.jpg', context,))
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount:
                  AddPersonDataCubit.get(context).imageCamera.length + 1,
                  itemBuilder: (context, index) {
                    return index == 0
                        ? Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child:
                                addPicture('assets/images/osman.jpg', context,),)
                        : Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: ClipOval(
                              child: Image.file(
                                File(
                                  AddPersonDataCubit.get(context)
                                      .imageCamera[index - 1]
                                      .path,
                                ),
                                fit: BoxFit.cover,
                                height: 180,
                                width: 180,
                              ),
                            ),
                          );
                  },
                ),
        ),
      ],
    );
  }

  Stack addPicture(String imageUrl,BuildContext context,) {
    return Stack(alignment: Alignment.bottomRight, children: [
      Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.3,
          ),
          shape: BoxShape.circle,
        ),
        child: ClipOval(
          child: Image.asset(
            imageUrl,
            height: 180,
            width: 180,
            fit: BoxFit.cover,
            //color: Colors.white,
          ),
        ),
      ),
      SizedBox(
        height: 50,
        width: 50,
        child: InkWell(
            child: SvgPicture.asset('assets/icons/add_icon.svg'),
            onTap: () => showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialogClass(
                      isDoneIcon: false,
                      height: 220.0,
                      widget: const TextClass(
                        text: 'اختر طريقه ادراج الصور',
                        fontSize: 25,
                      ),
                      bottomWidget: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const DividerClass(thickness: 1),
                            ListTile(
                                leading:
                                    const Icon(Icons.add_photo_alternate_outlined),
                                title: const TextClass(
                                    text: 'من المعرض',
                                    textAlign: TextAlign.start,
                                    fontSize: 20,
                                    textColor: mainColor,),
                                onTap: () {
                                  AddPersonDataCubit.get(context)
                                      .getImageFromGallery();
                                  Navigator.pop(context);
                                },),
                            ListTile(
                                leading: const Icon(Icons.add_a_photo_outlined),
                                title: const TextClass(
                                    text: 'الكاميرا',
                                    textAlign: TextAlign.start,
                                    fontSize: 20,
                                    textColor: mainColor,),
                                onTap: () {
                                  AddPersonDataCubit.get(context)
                                      .getImageFromCamera();
                                  Navigator.pop(context);
                                },),
                          ],
                        ),
                      ),
                    ),),),
      ),
    ],);
  }
}
