import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/presentations/profile/bloc/profile_cubit.dart';
import 'package:lost_app/presentations/profile/bloc/profile_states.dart';
import 'package:lost_app/shared/components/post_card.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/styles/color.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SavedPostsScreen extends StatelessWidget {
  final RefreshController _refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProfileCubit>(context).getSavedPosts();
    final profileCubit = BlocProvider.of<ProfileCubit>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: white,
          elevation: 0,
          centerTitle: true,
          title: const TextClass(text: 'المحفوظات', fontSize: 25),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_sharp, color: black),
          ),
        ),
        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    PostCard(
                      footerEnabled: false,
                      scrollPhysics: const NeverScrollableScrollPhysics(),
                      homePost: profileCubit.savedPosts!,
                      onLoading: () async {},
                      onRefresh: () async {},
                      refreshController: _refreshController,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
