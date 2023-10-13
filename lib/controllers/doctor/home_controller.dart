import 'dart:async';
import 'package:get/get.dart';
import 'package:hunter/constants/k.dart';
import 'package:hunter/models/user_model.dart';
import 'package:hunter/services/remote_services.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    getCurrentUser();
    super.onInit();
  }

  UserModel? _currentUser;
  UserModel? get currentUser => _currentUser;

  bool _isLoadingUser = true;
  bool get isLoadingUser => _isLoadingUser;

  bool _isFetchedUser = false;
  bool get isFetchedUser => _isFetchedUser;

  void setLoadingUser(bool value) {
    _isLoadingUser = value;
    update();
  }

  void setFetchedUser(bool value) {
    _isFetchedUser = value;
    update();
  }

  void getCurrentUser() async {
    try {
      _currentUser =
          (await RemoteServices.fetchCurrentUser().timeout(kTimeOutDuration))!;
      setFetchedUser(true);
    } on TimeoutException {
      setLoadingUser(false);
    } catch (e) {
      //
    } finally {
      update();
      setLoadingUser(false);
    }
  }

  Future refreshUser() async {
    setFetchedUser(false);
    setLoadingUser(true);
    getCurrentUser();
  }

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void changeTab(int index) {
    _currentIndex = index;
    update();
  }
}
