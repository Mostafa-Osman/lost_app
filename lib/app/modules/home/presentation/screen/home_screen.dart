import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/app/common/data/local/pref/user_pref.dart';
import 'package:lost_app/app/modules/home/bloc/home_cubit.dart';
import 'package:lost_app/shared/components/post_card.dart';
import 'package:lost_app/shared/components/smart_refresh.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<HomeCubit>(context);
    log('userToken${UserPrefs().getUserToken()}');
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          //log(homeCubit.homePosts[0].postId.toString());
          return homeCubit.homePosts.isEmpty
              ? const Center(
                  child:
                      TextClass(text: 'عذرا لا توجد منشورات في الوقت الحالي '),
                )
              : SmartRefresh(
                  footerEnabled: true,
                  listLength: homeCubit.homePosts.length,
                  controller: homeCubit.refreshController,
                  onLoading: () async {
                    await homeCubit.onLoading.call();
                  },
                  onRefresh: () async {
                    await homeCubit.onRefresh.call();
                  },
                  idleIconColor: mainColor,
                  waterDropColor: Colors.white,
                  child: SingleChildScrollView(
                    child: ColoredBox(
                      color: Colors.white,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 70.0,
                          ),
                          Container(
                            width: 500,
                            color: white,
                            child: PostCard(
                              footerEnabled: false,
                              scrollPhysics:
                                  const NeverScrollableScrollPhysics(),
                              isHome: true,
                              refreshController:
                                  homeCubit.fakeRefreshController,
                              homePost: homeCubit.homePosts,
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
