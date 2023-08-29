import 'package:flutter/material.dart';
import 'package:hunter/constants/colors.dart';
import 'package:hunter/widgets/auth_button.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: AuthButton(
                onPressed: () {},
                child: LoadingAnimationWidget.prograssiveDots(
                    color: Colors.white, size: 40)),
          )),
    );
  }
}
