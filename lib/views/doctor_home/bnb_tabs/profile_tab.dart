import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunter/constants/colors.dart';
import 'package:hunter/constants/routes_name.dart';
import 'package:hunter/controllers/doctor/bnb_tabs/profile_controller.dart';
import 'package:hunter/controllers/doctor/home_controller.dart';
import 'package:hunter/widgets/profile_button.dart';
import 'package:image_picker/image_picker.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController hC = Get.find();
    ProfileController pC = Get.put(ProfileController(user: hC.currentUser!));
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        children: [
          GestureDetector(
            onTap: () {
              Get.bottomSheet(
                SizedBox(
                  height: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ListTile(
                        onTap: () {
                          pC.pickImage(source: ImageSource.camera);
                        },
                        leading: const Icon(Icons.camera_alt),
                        title: const Text('From Camera'),
                      ),
                      ListTile(
                        onTap: () {
                          pC.pickImage(source: ImageSource.gallery);
                        },
                        leading: const Icon(Icons.image_outlined),
                        title: const Text('From Gallery'),
                      ),
                    ],
                  ),
                ),
                backgroundColor: Colors.white,
              );
            },
            child: GetBuilder<ProfileController>(builder: (controller) {
              return pC.image != null
                  ? ClipOval(
                      child: Container(
                        width: 180.0,
                        height: 180.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: FileImage(
                                pC.image!), // Use your image file here
                          ),
                        ),
                      ),
                    )
                  : const Icon(
                      CupertinoIcons.profile_circled,
                      size: 100,
                      color: AppColors.myPrimary,
                    );
            }),
          ),
          const SizedBox(height: 10.0),
          Center(
            child: Text(
              "Welcome back ${hC.currentUser != null ? hC.currentUser!.name : ''} ",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontSize: 22),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "ACCOUNT".tr,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          ProfileButton(
            title: 'MY ORDERS'.tr,
            icon: Icons.shopping_bag_outlined,
            onPressed: () {},
          ),
          ProfileButton(
            onPressed: () {
              Get.toNamed(AppRoute.profileDetails);
            },
            icon: Icons.person_outline,
            title: "MY DETAILS".tr,
          ),
          ProfileButton(
            onPressed: () {},
            icon: Icons.location_on_outlined,
            title: "ADDRESSES".tr,
          ),
          ProfileButton(
            onPressed: () {
              Get.toNamed(
                AppRoute.profileSettings,
              );
            },
            icon: Icons.settings_outlined,
            title: "SETTINGS".tr,
          ),
          const SizedBox(height: 10),
          Text(
            "SUPPORT".tr,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          ProfileButton(
            onPressed: () {},
            icon: Icons.help_outline,
            title: "MEDIGEAR SUPPORT".tr,
          ),
          const SizedBox(height: 10),
          Text(
            "MORE WITH MEDIGEAR".tr,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          ProfileButton(
            onPressed: () {},
            icon: Icons.chat_bubble_outline,
            title: "SOCIAL".tr,
          ),
          ProfileButton(
            onPressed: () {},
            icon: Icons.apps_outlined,
            title: "CHANGE ICON".tr,
          ),
          const SizedBox(height: 60),
          ProfileButton(
            title: 'Sign out'.tr,
            icon: Icons.logout,
            onPressed: () {
              pC.logOut();
            },
            borderColor: Colors.red,
            iconColor: Colors.red,
          ),
        ],
      ),
    );
  }
}
