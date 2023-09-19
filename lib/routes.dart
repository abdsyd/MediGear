import 'package:get/get.dart';
import 'package:hunter/constants/routes_name.dart';
import 'package:hunter/middleware/onboarding_middleware.dart';
import 'package:hunter/views/auth/forgot_password1_view.dart';
import 'package:hunter/views/auth/forgot_password2_view.dart';
import 'package:hunter/views/auth/forgot_password_otp.dart';
import 'package:hunter/views/doctor_home/bnb_tabs/cart_tab.dart';
import 'package:hunter/views/doctor_home/bnb_tabs/explore_tab.dart';
import 'package:hunter/views/doctor_home/bnb_tabs/profile_tab.dart';
import 'package:hunter/views/doctor_home/bnb_tabs/search_tab.dart';
import 'package:hunter/views/doctor_home/bnb_tabs/wishlist_tab.dart';
import 'package:hunter/views/doctor_home/home_view.dart';
import 'package:hunter/views/doctor_home/products_view.dart';
import 'package:hunter/views/auth/login_view.dart';
import 'package:hunter/views/auth/register_otp.dart';
import 'package:hunter/views/auth/register_view.dart';
import 'package:hunter/views/doctor_home/profile_details.dart';
import 'package:hunter/views/doctor_home/profile_settings.dart';
import 'package:hunter/views/onboarding_view.dart';
import 'package:hunter/views/supplier_home/bnb_tabs/dashboard.dart';
import 'package:hunter/views/supplier_home/bnb_tabs/products.dart';
import 'package:hunter/views/supplier_home/home_view.dart';

List<GetPage<dynamic>> routes = [
  GetPage(
      name: AppRoute.onboarding,
      page: () => const OnboardingView(),
      middlewares: [OnBoardingMiddleware()]),
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
    name: AppRoute.doctorHome,
    page: () => const DoctorHomeView(),
  ),
  GetPage(
    name: AppRoute.exploreTab,
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
    page: () =>  ProfileTab(),
  ),
  GetPage(
    name: AppRoute.products,
    page: () => ProductsView(),
  ),
  GetPage(
    name: AppRoute.profileSettings,
    page: () => const ProfileSettings(),
  ),
  GetPage(
    name: AppRoute.profileDetails,
    page: () => const ProfileDetails(),
  ),
  GetPage(
    name: AppRoute.supplierHome,
    page: () => const SupplierHomeView(),
  ),
  GetPage(
    name: AppRoute.supplierTab1,
    page: () => const Dashboard(),
  ),
  GetPage(
    name: AppRoute.supplierTab2,
    page: () => const Products(),
  ),
];
