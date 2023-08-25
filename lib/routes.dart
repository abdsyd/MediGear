import 'package:get/get.dart';
import 'package:hunter/constants/routes_name.dart';
import 'package:hunter/views/login_view.dart';
import 'package:hunter/views/register_view.dart';
import 'package:hunter/views/welcome_view.dart';

List<GetPage<dynamic>> routes = [
  GetPage(
    name: AppRoute.welcome,
    page: () => const WelcomeView(),
  ),
  GetPage(
    name: AppRoute.login,
    page: () => const LoginView(),
  ),
  GetPage(
    name: AppRoute.register,
    page: () => const RegisterView(),
  ),
];