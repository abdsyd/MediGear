import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnboardingController extends GetxController {

  @override
  void onInit() {
    GetStorage().write('onboarding', true);

    super.onInit();
  }
}
