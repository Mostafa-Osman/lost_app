import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lost_app/modules/profile/profile_cubit/cubit.dart';
import 'package:lost_app/shared/components/custom_button.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/components/text_form_field_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class EditProfileScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var cubit = ProfileCubit.get(context);
    cubit.setEditPageController();
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: TextClass(
            text: 'تعديل الملف',
            textAlign: TextAlign.center,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_sharp, color: black),
        ),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: white,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: black,
                      width: 1.3,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: ClipOval(
                      child: Stack(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: Image.asset(
                              cubit.image,
                              height: 180,
                              width: 180,
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
                              color: Color.fromRGBO(0, 0, 0, 0.7),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 5.0),
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
                SizedBox(height: 30),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.topRight,
                          child: TextClass(
                            text: ' الاسم: ',
                          )),
                      TextFormFieldClass(
                        controller: cubit.nameController,
                        maxLines: null,
                        fontSize: 18,
                        validator: (value) =>
                            value!.isEmpty ? 'من فضلك ادخل الاسم' : null,
                        keyboardType: TextInputType.name,
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 20),
                      Align(
                          alignment: Alignment.topRight,
                          child: TextClass(
                            text: ' الهاتف: ',
                          )),
                      TextFormFieldClass(
                        controller: cubit.numberController,
                        suffixIcon: Icon(Icons.phone),
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
                      SizedBox(height: 20),
                      Align(
                          alignment: Alignment.topRight,
                          child: TextClass(
                            text: ' البريد الالكتروني: ',
                          )),
                      TextFormFieldClass(
                        controller: cubit.emailController,
                        suffixIcon: Icon(Icons.email),
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
                SizedBox(height: 50),
                CustomButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      cubit.setEditPageDetails();
                      Navigator.pop(context);
                    }
                  },
                  text: 'حفظ',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
