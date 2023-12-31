import 'package:flutter/material.dart';
import 'package:hunter/constants/colors.dart';


class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,  required this.onPressed,  this.color, required this.child,
  });
  final Widget child;
  final void Function() onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      height: 50,
      onPressed:onPressed ,
      color: color ?? AppColors.myPrimary,
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),side: const BorderSide(color: AppColors.myWhite,width: 2)),
      child: child
    );
  }
}