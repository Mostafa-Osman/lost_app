import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'profile_states.dart';
class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitialState());

  static ProfileCubit get(BuildContext context) => BlocProvider.of(context);

  String image = 'assets/images/IMG20201116145812.jpg';
  String name = 'منصور طارق منصور محمد منصور';
  String number = '01149589134';
  String email = 'mansourtarek100@gmail.com';

  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  void setEditPageController(){
    nameController.text = name;
    numberController.text = number;
    emailController.text = email;
    emit(SetEditPageControllerState());
  }
  void setEditPageDetails(){
    name = nameController.text;
    number = numberController.text;
    email = emailController.text;
    emit(SetEditPageDetailsState());
  }
}
