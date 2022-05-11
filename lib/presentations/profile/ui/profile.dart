import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/presentations/profile/profile_cubit/profile_cubit.dart';
import 'package:lost_app/shared/components/post_card.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class ProfileClass extends StatelessWidget {

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BlocConsumer<ProfileCubit, ProfileStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = ProfileCubit.get(context);
        return SingleChildScrollView(
          child: Align(
            //alignment: Alignment.topCenter,
            child: Container(
              width: 500,
              color: white,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(

                      children: [
                        const SizedBox(height: 30),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.3,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: ClipOval(
                              child: Image.asset(
                                cubit.image,
                                height: 180,
                                width: 180,
                                fit: BoxFit.cover,
                                //color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        TextClass(
                          text: cubit.name,
                          fontSize: size.width >= 500 ? 22 : size.width / 18,
                          overflow: TextOverflow.clip,
                        ),
                        const SizedBox(height: 20),
                        AccountTextFormField(
                          text: cubit.number,
                          icon: Icons.phone,
                        ),
                        const SizedBox(height: 3),
                        AccountTextFormField(
                          text: cubit.email,
                          icon: Icons.email,
                        ),
                        const SizedBox(height: 30),
                        TextClass(
                          text: 'المنشورات',
                          fontSize: size.width >= 500 ? 30 : size.width / 13,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  PostCard(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class AccountTextFormField extends StatelessWidget {
  final String text;
  final IconData icon;

  const AccountTextFormField({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          color: lightBlue,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: ListView(
            scrollDirection: Axis.horizontal,
            reverse: true,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 7.0),
                    child: TextClass(
                      text: text,
                      fontSize: size.width >= 500 ? 18 : size.width / 22,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    iconSize: size.width >= 500 ? 25 : size.width / 20,
                    icon: Icon(icon),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
