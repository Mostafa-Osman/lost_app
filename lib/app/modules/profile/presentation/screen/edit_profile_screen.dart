import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lost_app/app/modules/profile/bloc/profile_cubit.dart';
import 'package:lost_app/app/modules/profile/bloc/profile_states.dart';
import 'package:lost_app/shared/components/add_photo_dialog.dart';
import 'package:lost_app/shared/components/constant.dart';
import 'package:lost_app/shared/components/custom_button.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/components/text_form_field_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class EditProfileScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: TextClass(
              text: 'تعديل الملف',
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_sharp, color: black),
          ),
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: white,
          elevation: 0,
        ),
        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            final profileCubit = BlocProvider.of<ProfileCubit>(context);
            return SingleChildScrollView(
              child: ColoredBox(
                color: white,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.3,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: ClipOval(
                            child:

                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AddPhotoDialog(
                                        onPressedCamera: () async {
                                          profileCubit.getImageFromCamera();
                                          Navigator.pop(context);
                                        },
                                        onPressedGallery: () async {
                                          profileCubit.getImageFromGallery();
                                          Navigator.pop(context);
                                        },
                                      ),
                                );
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    height: 180,
                                    width: 180,
                                    alignment: Alignment.center,
                                    child: profileCubit.mainImage == null
                                        ? profileCubit.profileModel!.photo != ""
                                            ? Image.network(
                                                AppConst.imageUrl +
                                                    profileCubit
                                                        .profileModel!.photo
                                                        .toString(),

                                                fit: BoxFit.cover,
                                                //color: Colors.white,
                                              )
                                            : SvgPicture.asset(
                                                'assets/images/person.svg',
                                                fit: BoxFit.cover,
                                              )
                                        : Image.file(
                                            profileCubit.mainImage!,

                                            fit: BoxFit.cover,
                                            //color: Colors.white,
                                          ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    child: Container(
                                      alignment: Alignment.bottomCenter,
                                      height: 50,
                                      width: 180,
                                      color: const Color.fromRGBO(0, 0, 0, 0.7),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5.0),
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: SvgPicture.asset(
                                            'assets/icons/edit_profile_icon.svg',
                                            height: 60,
                                            width: 60,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            const Align(
                              alignment: Alignment.topRight,
                              child: TextClass(
                                text: ' الاسم: ',
                              ),
                            ),
                            TextFormFieldClass(
                              controller: profileCubit.nameController,
                              maxLines: null,
                              fontSize: 18,
                              validator: (value) =>
                                  value!.isEmpty ? 'من فضلك ادخل الاسم' : null,
                              keyboardType: TextInputType.name,
                              overflow: TextOverflow.clip,
                            ),
                            const SizedBox(height: 20),
                            const Align(
                              alignment: Alignment.topRight,
                              child: TextClass(
                                text: ' الهاتف: ',
                              ),
                            ),
                            TextFormFieldClass(
                              controller: profileCubit.numberController,
                              suffixIcon: const Icon(Icons.phone),
                              keyboardType: TextInputType.phone,
                              validator: (value) => value!.isEmpty
                                  ? 'من فضلك ادخل رقم هاتفك'
                                  : (value.length != 11)
                                      ? 'رقم الهاتف غير صحيح'
                                      : null,
                              textAlign: TextAlign.end,
                              fontSize: 18,
                              height: 1.8,
                            ),
                            const SizedBox(height: 20),
                            const Align(
                              alignment: Alignment.topRight,
                              child: TextClass(
                                text: ' البريد الالكتروني: ',
                              ),
                            ),
                            TextFormFieldClass(
                              controller: profileCubit.emailController,
                              suffixIcon: const Icon(Icons.email),
                              validator: (value) =>
                                  (value!.isEmpty || !value.contains('@'))
                                      ? 'البريد الالكتروني الذي ادخلته غير صحيح'
                                      : null,
                              keyboardType: TextInputType.emailAddress,
                              textAlign: TextAlign.end,
                              fontSize: 18,
                              height: 1.8,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 50),
                      CustomButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            profileCubit.updateProfile();
                            Navigator.pop(context);
                          }
                        },
                        text: 'حفظ',
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
