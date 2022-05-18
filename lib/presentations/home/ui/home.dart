import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/authentication/presentation/login/login_cubit/login_cubit.dart';
import 'package:lost_app/authentication/presentation/login/widgets/loading.dart';
import 'package:lost_app/shared/components/post_card.dart';
import 'package:lost_app/shared/styles/color.dart';

class HomeClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginStates>(
      builder: (context, state) {
        if (state is LoginLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is LoginError) {
       return   const Center(
            child: Text('Error'),
          );
        } else {
          return SingleChildScrollView(
            child: Align(
              child: Container(
                width: 500,
                color: white,
                child: PostCard(),
              ),
            ),
          );
        }
      },
    );
  }
}
