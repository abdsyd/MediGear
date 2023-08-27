import 'package:flutter/material.dart';
import 'package:hunter/constants/colors.dart';

class AuthSuggestion extends StatelessWidget {
  const AuthSuggestion({
    super.key, required this.question, required this.suggestion, required this.onTap,
  });

  final String question;
  final String suggestion;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          question,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Colors.black,
          ),
        ),
        const SizedBox(width: 15,),
        InkWell(
          onTap:onTap,
          child:  Text(
            suggestion,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.myPrimary,
              fontSize: 14.5,
            ),
          ),
        ),
      ],
    );
  }
}