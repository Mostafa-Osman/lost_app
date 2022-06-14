import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/presentations/profile/bloc/profile_cubit.dart';
import 'package:lost_app/presentations/profile/bloc/profile_states.dart';
import 'package:lost_app/presentations/profile/presentation/widgets/profile_text_field.dart';
import 'package:lost_app/shared/components/post_card.dart';
import 'package:lost_app/shared/components/smart_refresh.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class ProfileScreen extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final profileCubit = BlocProvider.of<ProfileCubit>(context);
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is ProfileLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return SmartRefresh(
            footerEnabled: true,
            listLength: profileCubit.profileModel!.posts.length,
            controller: profileCubit.refreshController,
            onLoading: () async {
              await profileCubit.onLoading.call();
            },
            onRefresh: () async {
              await profileCubit.onRefresh.call();
            },
            idleIconColor: mainColor,
            waterDropColor: Colors.white,
            child: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    const SizedBox(height: 70.0,),
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
                                child: Image.network(
                                  profileCubit.profileModel!.photo!,
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
                            text: profileCubit.profileModel!.username!,
                            fontSize: size.width >= 500 ? 22 : size.width / 18,
                            overflow: TextOverflow.clip,
                          ),
                          const SizedBox(height: 20),
                          ProfileTextField(
                            text: profileCubit.profileModel!.phoneNumber!,
                            icon: Icons.phone,
                          ),
                          const SizedBox(height: 3),
                          ProfileTextField(
                            text: profileCubit.profileModel!.email!,
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
                    SizedBox(
                      height: profileCubit.profileModel!.posts.length * 257,
                      child: PostCard(
                        isProfile: true,
                        footerEnabled: false,
                        refreshController: profileCubit.fakeRefreshController,
                        scrollPhysics: const NeverScrollableScrollPhysics(),
                        homePost: profileCubit.profileModel!.posts,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
