import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:image_picker/image_picker.dart';
import 'package:hunter/controllers/home/bnb_tabs/profile_controller.dart';
import 'package:hunter/controllers/home/home_controller.dart';

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
      body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipOval(
                child: Icon(
                  CupertinoIcons.profile_circled,
                  size: MediaQuery.sizeOf(context).width / 4,
                ),
              ),
              Text(
                'Welcome back  ${hC.currentUser != null ? hC.currentUser!.name : ''}',
              ),
            ],
          ),
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
