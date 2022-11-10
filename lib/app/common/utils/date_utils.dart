import 'dart:developer';

// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

String getTimeAgo(DateTime time) {
  final dateAgo = timeago.format(time);
  if (dateAgo.contains('moment') || dateAgo.contains('minute')) {
    log(DateFormat('yyyy-MM-dd hh:mm:ss', 'en').format(time));
    log(dateAgo);
    return dateAgo;
  } else if (dateAgo.contains('hour')) {
    return DateFormat('jm', 'en').format(time);
  } else if (dateAgo.contains('day ago')) {
    return 'yesterday';
  } else {
    return DateFormat('yyyy-MM-dd', 'en').format(time);
  }
}

DateTime getDateYearsAgo(int numOfYears) => DateTime(
      DateTime.now().year - numOfYears,
      DateTime.now().month,
      DateTime.now().day,
    );
