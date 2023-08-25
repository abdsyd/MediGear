import 'package:get/get.dart';
import 'package:hunter/constants/routes_name.dart';
import 'package:hunter/views/login_view.dart';

List<GetPage<dynamic>> routes = [

GetPage(
  name: AppRoute.login,
  page: () => const LoginView(),
),
];