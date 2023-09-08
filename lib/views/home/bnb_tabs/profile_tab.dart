import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:hunter/controllers/home/bnb_tabs/profile_controller.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController pC = Get.put(ProfileController());
    return GetBuilder<ProfileController>(
      builder: (pC) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Center(
            child: GestureDetector(
              onTap: () {
                Get.bottomSheet(
                   SizedBox(
                    height: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ListTile(
                          onTap:(){pC.pickImage(ImageSource.camera);},
                          leading: const Icon(Icons.camera_alt),
                          title: const Text('From Camera'),
                        ),
                        ListTile(
                          onTap:(){pC.pickImage(ImageSource.gallery);},
                          leading: const Icon(Icons.image_outlined),
                          title: const Text('From Gallery'),
                        ),
                      ],
                    ),
                  ),
                  backgroundColor: Colors.white,
                );
              },
              child: ClipOval(
                child: pC.image != null
                    ? Image.file(
                        pC.image!,
                        width: 160,
                        height: 160,
                        fit: BoxFit.cover,
                      )
                    : const Icon(CupertinoIcons.profile_circled,size: 150,),
              ),
            ),
          ),
        );
      }
    );
  }
}
