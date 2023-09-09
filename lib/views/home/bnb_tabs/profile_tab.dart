import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunter/constants/colors.dart';
//import 'package:image_picker/image_picker.dart';
import 'package:hunter/controllers/home/bnb_tabs/profile_controller.dart';
import 'package:hunter/controllers/home/home_controller.dart';
import 'package:hunter/widgets/profile_button.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController pC = Get.put(ProfileController());
    HomeController hC = Get.find();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children:  [
          const CircleAvatar(
            radius: 50,
            child: Icon(Icons.person,size: 100,),
          ),
          const SizedBox(height: 10.0),
          Center(
            child: Text(
              "Welcome back ${hC.currentUser != null ? hC.currentUser!.name : ''} ",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 22),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "ACCOUNT".tr,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          ProfileButton(title: 'MY ORDERS'.tr, icon: Icons.shopping_bag_outlined,onPressed: (){},),
          ProfileButton(
            onPressed: (){},
            icon: Icons.person_outline,
            title: "MY DETAILS".tr,
          ),
          ProfileButton(
            onPressed: (){},
            icon: Icons.location_on_outlined,
            title: "ADDRESSES".tr,
          ),
          ProfileButton(
            onPressed: (){},
            icon: Icons.settings_outlined,
            title: "SETTINGS".tr,
          ),
          const SizedBox(height: 10,),
          Text(
            "SUPPORT".tr,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          ProfileButton(
            onPressed: (){},
            icon: Icons.help_outline,
            title: "MEDIGEAR SUPPORT".tr,
          ),
          const SizedBox(height: 10,),
          Text(
            "MORE WITH MEDIGEAR".tr,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          ProfileButton(
            onPressed: (){},
            icon: Icons.chat_bubble_outline,
            title: "SOCIAL".tr,
          ),
      ProfileButton(
        onPressed: (){},
        icon: Icons.apps_outlined,
        title: "CHANGE ICON".tr,
      ),
        ],
      ),
    );
  }
}



// GestureDetector(
// onTap: () {
// Get.bottomSheet(
// SizedBox(
// height: 120,
// child: Column(
// mainAxisAlignment: MainAxisAlignment.spaceAround,
// children: [
// ListTile(
// //onTap:(){pC.pickImage(ImageSource.camera);},
// leading: const Icon(Icons.camera_alt),
// title: const Text('From Camera'),
// ),
// ListTile(
// //onTap:(){pC.pickImage(ImageSource.gallery);},
// leading: const Icon(Icons.image_outlined),
// title: const Text('From Gallery'),
// ),
// ],
// ),
// ),
// backgroundColor: Colors.white,
// );
// },
// child: ClipOval(
// child: pC.image != null
// ? Image.file(
// pC.image!,
// width: 160,
// height: 160,
// fit: BoxFit.cover,
// )
//     : const Icon(CupertinoIcons.profile_circled,size: 150,),
// ),
// ),

//------------------------------------------------------------------\\


// Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Expanded(
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// ClipOval(
// child: Icon(
// CupertinoIcons.profile_circled,
// size: MediaQuery.sizeOf(context).width / 4,
// ),
// ),
// Text(
// 'Welcome back  ${hC.currentUser != null ? hC.currentUser!.name : ''}',
// ),
// ],
// ),
// ),
// ],
// ),