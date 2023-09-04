import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunter/constants/colors.dart';
import 'package:hunter/controllers/register_controller.dart';

class AuthToggleButton extends StatelessWidget {
  const AuthToggleButton({
    super.key, required this.onSelectionChanged,
  });

  final void Function(int)? onSelectionChanged;

  @override
  Widget build(BuildContext context) {
    RegisterController rC = Get.find();
    return  Padding(
        padding: const EdgeInsets.all(8.0),
        child: ToggleButtons(
          isSelected: rC.isSelected,
          onPressed: (int newIndex){
            rC.toggleSelections(newIndex);
            onSelectionChanged?.call(newIndex);

          },
          borderRadius: BorderRadius.circular(6.5),
          borderWidth: 2.0,
          textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 13),
          fillColor: AppColors.myPrimary,
          selectedColor: Colors.white,
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Icon(Icons.medical_services_outlined),
                  Text('doctor'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Icon(Icons.storefront),
                  Text(
                    'supplier',
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  }
}