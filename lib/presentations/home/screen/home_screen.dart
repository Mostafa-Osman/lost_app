import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/presentations/home/bloc/home_cubit.dart';
import 'package:lost_app/shared/components/post_card.dart';
import 'package:lost_app/shared/styles/color.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final postCardCubit = BlocProvider.of<HomeCubit>(context);
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Align(
                child: Container(
                  width: 500,
                  color: white,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: postCardCubit.homePosts.length,
                    itemBuilder: (context, index) {
                      final post = postCardCubit.homePosts[index];
                      return PostCard(
                        userPhoto: post.userPhoto,
                        username: post.username,
                        personName: post.personData!.personName,
                        lostAge: post.personData!.age,
                        lostGender: post.personData!.gender,
                        lostAddressCity: post.personData!.address.city,
                        lostAddressDistrict:
                            post.personData!.address.district,
                        lostMainPhoto: post.personData!.mainPhoto,
                        isOwner: post.isOwner,
                        postId: post.postId,
                        isSaved: post.isSaved,
                        userPhoneNumber: post.userPhoneNumber,
                        index: index,
                      );
                    },
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
