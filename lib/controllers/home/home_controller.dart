import 'dart:async';
import 'package:get/get.dart';
import 'package:hunter/constants/k.dart';
import 'package:hunter/models/user_model.dart';
import 'package:hunter/services/remote_services.dart';


class HomeController extends GetxController {

  late UserModel _currentUser;
  UserModel get currentUser => _currentUser;

  void getCurrentUser() async {
    try {
      _currentUser = (await RemoteServices.fetchCurrentUser().timeout(kTimeOutDuration))!;
      //setFetchedUser(true);
    } on TimeoutException {
      //setLoadingUser(false);
    } catch (e) {
      //
    } finally {
      //setLoadingUser(false);
    }
  }

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void changeTab(int index) {
    _currentIndex = index;
    update();
  }
}
