import 'package:flutter/cupertino.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/styles/color.dart';
import 'package:timer_count_down/timer_count_down.dart';

class TimerClass extends StatelessWidget{
  final int seconds;
  final Duration interval;
  final Function onFinished;
  TimerClass( this.seconds, this.interval,this.onFinished);

  @override
  Widget build(BuildContext context) {
    return Countdown(
        seconds: seconds,
        build: (_, time) => TextClass(
          text: '(${time.toInt().toString()})',
          textColor: mainColor,
        ),
        interval: interval, //Duration(milliseconds: 1000),
        onFinished: onFinished);
  }
}
