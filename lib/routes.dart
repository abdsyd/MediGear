import 'package:get/get.dart';
import 'package:hunter/constants/routes_name.dart';
import 'package:hunter/views/auth/forgot_password1_view.dart';
import 'package:hunter/views/auth/forgot_password2_view.dart';
import 'package:hunter/views/auth/forgot_password_otp.dart';
import 'package:hunter/views/home/bnb_tabs/cart_tab.dart';
import 'package:hunter/views/home/bnb_tabs/explore_tab.dart';
import 'package:hunter/views/home/bnb_tabs/profile_tab.dart';
import 'package:hunter/views/home/bnb_tabs/search_tab.dart';
import 'package:hunter/views/home/bnb_tabs/wishlist_tab.dart';
import 'package:hunter/views/home/home_view.dart';
import 'package:hunter/views/home/products_view.dart';
import 'package:hunter/views/auth/login_view.dart';
import 'package:hunter/views/auth/register_otp.dart';
import 'package:hunter/views/auth/register_view.dart';
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
  GetPage(
    name: AppRoute.registerOTP,
    page: () => const RegisterOTP(),
  ),
  GetPage(
    name: AppRoute.forgotPassword1,
    page: () => const ForgotPass1View(),
  ),
  GetPage(
    name: AppRoute.forgotPasswordOTP,
    page: () => const ForgotPassOTP(),
  ),
  GetPage(
    name: AppRoute.forgotPassword2,
    page: () => const ForgotPass2View(),
  ),
  GetPage(
    name: AppRoute.home,
    page: () => const HomeView(),
  ),
  GetPage(
    name: AppRoute.homeTab,
    page: () => const ExploreTab(),
  ),
  GetPage(
    name: AppRoute.searchTab,
    page: () => const SearchTab(),
  ),
  GetPage(
    name: AppRoute.cartTab,
    page: () => const CartTab(),
  ),
  GetPage(
    name: AppRoute.wishlistTab,
    page: () => const WishListTab(),
  ),
  GetPage(
    name: AppRoute.profileTab,
    page: () => const ProfileTab(),
  ),
  GetPage(
    name: AppRoute.products,
    page: () => ProductsView(),
  ),
];
