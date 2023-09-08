import 'package:get/get.dart';
import 'package:hunter/constants/routes_name.dart';
import 'package:hunter/services/remote_services.dart';

class ProfileController extends GetxController{

  //File? image;

//   Future pickImage(ImageSource source) async {
//
//       final image = await ImagePicker().pickImage(source: source);
//       if (image == null) return;
//
//       this.image = File(image.path);
//
//       update();
//
// }

  void logOut() async {
    if (await RemoteServices.signOut()) {
      Get.offAllNamed(AppRoute.login);
    }
  }

}