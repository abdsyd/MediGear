import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class OtpTimer extends StatelessWidget {
  const OtpTimer({
    super.key,
    required this.controller,
    required this.timerColor,
    this.onFinished,
  });

  final CountdownController controller;
  final Color timerColor;
  final Function? onFinished;

  @override
  Widget build(BuildContext context) {
    return Countdown(
      controller: controller,
      seconds: 30,
      build: (context, double time) => Text(
        time.toString(),
        style: Theme.of(context).textTheme.displayMedium!.copyWith(
              color: timerColor,
            ),
      ),
      onFinished: onFinished,
    );
  }
}
