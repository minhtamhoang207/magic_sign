import 'package:get/get.dart';

import '../../presentation/dash_board/bindings/dash_board_binding.dart';
import '../../presentation/dash_board/views/dash_board_view.dart';
import '../../presentation/detect_sign/bindings/detect_sign_binding.dart';
import '../../presentation/detect_sign/views/detect_sign_view.dart';
import '../../presentation/explore/bindings/explore_binding.dart';
import '../../presentation/explore/views/explore_view.dart';
import '../../presentation/home/bindings/home_binding.dart';
import '../../presentation/home/views/home_view.dart';
import '../../presentation/intro/bindings/intro_binding.dart';
import '../../presentation/intro/views/intro_view.dart';
import '../../presentation/learning/bindings/learning_binding.dart';
import '../../presentation/learning/views/learning_view.dart';
import '../../presentation/login/bindings/login_binding.dart';
import '../../presentation/login/views/login_view.dart';
import '../../presentation/profile/bindings/profile_binding.dart';
import '../../presentation/profile/views/profile_view.dart';
import '../../presentation/sign_up/bindings/sign_up_binding.dart';
import '../../presentation/sign_up/views/sign_up_view.dart';
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
        transition: Transition.rightToLeftWithFade),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.DASH_BOARD,
      page: () => const DashBoardView(),
      binding: DashBoardBinding(),
    ),
    GetPage(
      name: _Paths.EXPLORE,
      page: () => const ExploreView(),
      binding: ExploreBinding(),
    ),
    GetPage(
      name: _Paths.DETECT_SIGN,
      page: () => const DetectSignView(),
      binding: DetectSignBinding(),
    ),
    GetPage(
      name: _Paths.LEARNING,
      page: () => const LearningView(),
      binding: LearningBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
  ];
}
