import 'package:get/get.dart';
import 'package:hunter/constants/routes_name.dart';
import 'package:hunter/services/remote_services.dart';

class ProfileController extends GetxController{

  void logOut() async {
    if (await RemoteServices.signOut()) {
      Get.offAllNamed(AppRoute.login);
    }
  }

}