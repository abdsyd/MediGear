import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunter/controllers/bnb_tabs/profile_controller.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController pC = Get.put(ProfileController());
    return const Placeholder(child: Center(child: Text('profile'),),);
  }
}
