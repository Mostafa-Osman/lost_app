import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/modules/profile/profile_cubit/states.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitialState());

  static ProfileCubit get(context) => BlocProvider.of(context);

  String image = 'assets/images/IMG20201116145812.jpg';
  String name = 'منصور طارق منصور محمد منصور';
  String number = '01149589134';
  String email = 'mansourtarek100@gmail.com';
}
