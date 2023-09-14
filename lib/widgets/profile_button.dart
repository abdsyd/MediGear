import 'package:flutter/material.dart';
import 'package:hunter/constants/colors.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    super.key, required this.title,  this.icon, this.onPressed,  this.trailing, this.iconColor, this.borderColor,
  });

  final String title;
  final Color? iconColor;
  final Color? borderColor;
  final IconData? icon;
  final Widget? trailing;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor ??AppColors.myPrimary),
        color: Colors.grey.shade200,
      ),
      child: ListTile(
        onTap: onPressed,
        iconColor:iconColor ?? AppColors.myPrimary ,
        titleTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black),
        leading:  Icon(icon),
        title: Text(title),
        trailing: trailing,
      ),
    );
  }
}