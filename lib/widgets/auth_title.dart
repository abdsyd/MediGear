import 'package:flutter/material.dart';

class AuthTitle extends StatelessWidget {
  const AuthTitle({
    super.key, required this.title,  required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: Colors.black),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          subTitle,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.grey.shade700,),
        ),
      ],
    );
  }
}
