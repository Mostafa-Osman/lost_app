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
            child: Align(
              child: Column(
                children: [
                  Container(
                    width: 500,
                    height: MediaQuery.of(context).size.height-220,
                    color: white,
                    child: PostCard(
                      homePost: postCardCubit.homePosts,
                    ),
                  ),
                  //const SizedBox(height: 100,),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
