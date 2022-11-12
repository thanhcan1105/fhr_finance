import 'package:ykapay/app/bindings/accumulated_income_binding.dart';
import 'package:ykapay/app/bindings/camera_binding.dart';
import 'package:ykapay/app/bindings/collaborators_binding.dart';
import 'package:ykapay/app/bindings/community_binding.dart';
import 'package:ykapay/app/bindings/customer_binding.dart';
import 'package:ykapay/app/bindings/info_user_binding.dart';
import 'package:ykapay/app/bindings/item_binding.dart';
import 'package:ykapay/app/bindings/settings_binding.dart';
import 'package:ykapay/app/bindings/verify_account_binding.dart';
import 'package:ykapay/app/screens/accumulated_income.dart/accumulated_income_screen.dart';
import 'package:ykapay/app/screens/camera/camera.dart';
import 'package:ykapay/app/screens/collaborators/collaborators_screen.dart';
import 'package:ykapay/app/screens/community/community_screen.dart';
import 'package:ykapay/app/screens/customer/customer_screen.dart';
import 'package:ykapay/app/screens/bottom_menu/bottom_menu.dart';
import 'package:ykapay/app/screens/home/home_screen.dart';
import 'package:ykapay/app/screens/info_user/info_user.dart';
import 'package:ykapay/app/screens/item/item_screen.dart';
import 'package:ykapay/app/screens/settings/settings_screen.dart';
import 'package:ykapay/app/screens/settings/verify_account/verify_account.dart';

import './../app/bindings/home_binding.dart';
import './../app/screens/register/register_screen.dart';
import './../app/bindings/register_binding.dart';
import './../app/screens/login/login_screen.dart';
import './../app/bindings/login_binding.dart';
import './../app/screens/splash/splash_screen.dart';
import './../app/bindings/splash_binding.dart';
import 'package:get/get.dart';
part './routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashScreen(),
      transition: Transition.cupertino,
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginScreen(),
      transition: Transition.cupertino,
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => RegisterScreen(),
      transition: Transition.cupertino,
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(),
      transition: Transition.cupertino,
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.BOTTOMMENU,
      page: () => BottomMenu(),
      transition: Transition.cupertino,
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.ACCUMULATEDINCOME,
      page: () => AccumulatedIncomeScreen(),
      transition: Transition.cupertino,
      binding: AccumulatedIncomeBinding(),
    ),
    GetPage(
      name: Routes.CUSTOMER,
      page: () => CustomerScreen(),
      transition: Transition.cupertino,
      binding: CustomerBinding(),
    ),
    GetPage(
      name: Routes.ITEM,
      page: () => ItemScreen(),
      transition: Transition.cupertino,
      binding: ItemBinding(),
    ),
    GetPage(
      name: Routes.COLLABORATORS,
      page: () => CollaboratorsScreen(),
      transition: Transition.cupertino,
      binding: CollaboratorsBinding(),
    ),
    GetPage(
      name: Routes.COMMUNITY,
      page: () => CommunityScreen(),
      transition: Transition.cupertino,
      binding: CommunityBinding(),
    ),
    GetPage(
      name: Routes.SETTING,
      page: () => SettingScreen(),
      transition: Transition.cupertino,
      binding: SettingsBinding(),
    ),
    GetPage(
      name: Routes.VERYFYACCOUNT,
      page: () => VerifyAccountScreen(),
      transition: Transition.cupertino,
      binding: VerifyAccountBinding(),
    ),
    GetPage(
      name: Routes.CAMERA,
      page: () => CameraScreen(),
      transition: Transition.cupertino,
      binding: CameraBinding(),
    ),
    GetPage(
      name: Routes.INFOUSER,
      page: () => InfoUserScreen(),
      transition: Transition.cupertino,
      binding: InfoUserBinding(),
    ),
  ];
}
