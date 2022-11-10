import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//
// import 'package:lost_app/app/modules/appointment/home/data/repositories/home_repo.dart';
// import 'package:lost_app/app/services/locator_service.dart';

part 'error_state.dart';

enum ConnectivityError { internetError, dataError }

class ErrorCubit extends Cubit<ErrorScreenState> {
  ErrorCubit() : super(ErrorInitial());
  //
  // Future<bool> isProblemSolved(ConnectivityError errorType) async {
  //   if (errorType == ConnectivityError.internetError) return isNotConnected;
  //   return isServerNotUnderMaintain;
  // }

  // Future<bool> get isNotConnected async {
  //   await fakeDelay();
  //   return isConnectedToInternet;
  // }

  // Future<bool> get isServerNotUnderMaintain async {
  //   await fakeDelay();
  //   return !(await homeRepo.getAppointmentData()).isUnderMaintaining;
  // }

  Future<void> fakeDelay() async {
    emit(ErrorLoading());
    // fake delay to simulate trying
    await Future.delayed(const Duration(seconds: 1));
    emit(ErrorInitial());
  }
}
