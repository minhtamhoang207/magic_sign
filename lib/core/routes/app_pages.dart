import 'package:get/get.dart';

import '../../presentation/home/bindings/home_binding.dart';
import '../../presentation/home/views/home_view.dart';
import '../../presentation/intro/bindings/intro_binding.dart';
import '../../presentation/intro/views/intro_view.dart';
import '../../presentation/login/bindings/login_binding.dart';
import '../../presentation/login/views/login_view.dart';
import '../../presentation/splash/bindings/splash_binding.dart';
import '../../presentation/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.INTRO,
      page: () => const IntroView(),
      binding: IntroBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
      transition: Transition.rightToLeftWithFade
    ),
  ];
}
