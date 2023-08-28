import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunter/constants/colors.dart';
import 'package:hunter/controllers/register_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';


class OtpTimer extends StatelessWidget {
  const OtpTimer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      builder: (controller) => Countdown(
        controller: controller.timeController,
        seconds: 180,
        build: (context, double time) => Text(
          time.toString(),
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(
              color: controller.isTimeUp
                  ? Colors.red
                  : AppColors.myPrimary),
        ),
        onFinished: () {
          controller.toggleTimerState(true);
        },
      ),
    );
  }
}