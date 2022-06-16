import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lost_app/presentations/notification/notificatin_model.dart';
import 'package:lost_app/presentations/notification/notification_cubit/notification_cubit.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        centerTitle: true,
        title: const TextClass(text: 'الاشعارات', fontSize: 25),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_sharp, color: black),
        ),
      ),
      body: BlocProvider(
        create: (context) => NotificationCubit()..getNotifications(),
        child: BlocConsumer<NotificationCubit, NotificationState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            final notifyCubit = BlocProvider.of<NotificationCubit>(context);
            if (state is NotificationLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return notifyCubit.notifications.isNotEmpty
                ? Container(
                    alignment: Alignment.center,
                    width: 500,
                    child: ListView.builder(
                      itemBuilder: (ctx, index) {
                        return NotificationItem(
                          notification: notifyCubit.notifications[index],
                        );
                      },
                      itemCount: notifyCubit.notifications.length,
                    ),
                  )
                : const Center(
                    child: TextClass(
                      text: 'لا توجد اشعارات متاحه في الوقت الحالي ',
                    ),
                  );
          },
        ),
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final NotificationModel notification;

  const NotificationItem({
    required this.notification,
  });

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height / 5.9;
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(top: 20, right: 10, left: 10),
        width: MediaQuery.of(context).size.width,
        height: height,
        decoration: BoxDecoration(
          color: lightBlue,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, right: 10),
                  child: ClipOval(
                    child: notification.postPhoto != null
                        ? Image.network(
                            notification.postPhoto!,
                            height: 40,
                            width: 40,
                            fit: BoxFit.cover,
                          )
                        : SvgPicture.asset(
                            'assets/images/person.svg',
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.9,
                  height: MediaQuery.of(context).size.height / 6.3,
                  padding: const EdgeInsets.only(top: 30, right: 5),
                  child: TextClass(
                    fontSize: height * 0.1,
                    textAlign: TextAlign.start,
                    text: notification.title!,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(
                      width: 90,
                      height: 20,
                    ),
                    SizedBox(
                      width: 90,
                      height: MediaQuery.of(context).size.height / 10.1,
                      child: notification.postPhoto != null
                          ? Image.network(
                              notification.postPhoto!,
                              width: 90,
                              fit: BoxFit.fill,
                            )
                          : null,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
