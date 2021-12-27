import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lost_app/modules/profile/profile_cubit/cubit.dart';
import 'package:lost_app/shared/components/text_form_field_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class EditProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var cubit = ProfileCubit.get(context);
    cubit.setEditPageController();
    return Scaffold(
      appBar: AppBar(
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
      body: Container(
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
              // TextClass(
              //   text: cubit.name,
              //   fontSize: size.width >= 500 ? 30 : size.width / 13,
              //   overflow: TextOverflow.clip,
              // ),
              TextFormFieldClass(
                controller: cubit.nameController,
                maxLines: null,
                fontSize: size.width >= 500 ? 30 : size.width / 13,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 20),
              TextFormFieldClass(
                controller: cubit.numberController,
                suffixIcon: Icon(Icons.phone),
                textAlign: TextAlign.end,
                height: 0.1,
              ),
              SizedBox(height: 3),
              TextFormFieldClass(
                controller: cubit.emailController,
                suffixIcon: Icon(Icons.email),
                textAlign: TextAlign.end,
                height: 1.5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
