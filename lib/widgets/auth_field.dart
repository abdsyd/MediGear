import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunter/constants/colors.dart';

class AuthField extends StatelessWidget {
  const AuthField({
    super.key,
    required this.label,
    required this.textController,
    required this.keyboardType,
    this.validator,
    required this.onChanged,
    required this.icon,
    this.onIconPressed,
    this.obscureText, this.autoFocus,
  });
  final String label;
  final bool? obscureText;
  final bool? autoFocus;
  final TextEditingController textController;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final void Function(String) onChanged;
  final void Function()? onIconPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: TextFormField(
        validator: validator,
        onChanged: onChanged,
        autofocus: autoFocus ?? false,
        controller: textController,
        cursorColor: AppColors.myPrimary,
        obscureText: obscureText ?? false,
        keyboardType: keyboardType,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 11),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: Colors.black45, fontSize: 15),
          suffixIcon: IconButton(
            onPressed: onIconPressed,
            icon: Icon(icon,color: AppColors.myPrimary,),
          ),
          errorStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.red,
              ),
          suffixIconColor: AppColors.myPrimary,
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(6.5),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(6.5),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.myPrimary),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(6.5),
          ),
        ),
      ),
    );
  }
}

String? validateInput(String val, int min, int max, String type) {
  if (val.trim().isEmpty) return "cant be empty";

  if (type == "username") {
    if (!GetUtils.isUsername(val)) return "not a valid user name";
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) return "not a valid email";
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) return "not a valid phone";
  }

  if (val.length < min) return " cant be smaller than $min";

  if (val.length > max) return " cant be greater than $max";

  return null;
}
