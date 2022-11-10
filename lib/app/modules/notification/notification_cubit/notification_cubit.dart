import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/app/modules/notification/notificatin_model.dart';
import 'package:lost_app/app/modules/notification/webservice/notification_webservice.dart';



part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());

  final notificationWebService = NotificationWebService();
  final notifications = <NotificationModel>[];

  Future<void> getNotifications() async {
    emit(NotificationLoading());
    try {
      notifications.clear();
      final data = await notificationWebService.getNotifications();
      notifications.addAll(data);
      emit(NotificationSuccess());
    } catch (e, s) {
      log('error on notifiocatins');
      emit(NotificationError("sorry couldn't load notifications"));
    }
  }
}
