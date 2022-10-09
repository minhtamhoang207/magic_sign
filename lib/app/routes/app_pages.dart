import 'package:get/get.dart';

import '../pages/course_detail/bindings/course_detail_binding.dart';
import '../pages/course_detail/views/course_detail_view.dart';
import '../pages/dash_board/bindings/dash_board_binding.dart';
import '../pages/dash_board/views/dash_board_view.dart';
import '../pages/detect_sign/bindings/detect_sign_binding.dart';
import '../pages/detect_sign/views/detect_sign_view.dart';
import '../pages/explore/bindings/explore_binding.dart';
import '../pages/explore/views/explore_view.dart';
import '../pages/home/bindings/home_binding.dart';
import '../pages/home/views/home_view.dart';
import '../pages/intro/bindings/intro_binding.dart';
import '../pages/intro/views/intro_view.dart';
import '../pages/learning/bindings/learning_binding.dart';
import '../pages/learning/views/learning_view.dart';
import '../pages/lesson_detail/bindings/lesson_detail_binding.dart';
import '../pages/lesson_detail/views/lesson_detail_view.dart';
import '../pages/login/bindings/login_binding.dart';
import '../pages/login/views/login_view.dart';
import '../pages/news_detail/bindings/news_detail_binding.dart';
import '../pages/news_detail/views/news_detail_view.dart';
import '../pages/profile/bindings/profile_binding.dart';
import '../pages/profile/views/profile_view.dart';
import '../pages/quiz/bindings/quiz_binding.dart';
import '../pages/quiz/views/quiz_view.dart';
import '../pages/sign_up/bindings/sign_up_binding.dart';
import '../pages/sign_up/views/sign_up_view.dart';
import '../pages/splash/bindings/splash_binding.dart';
import '../pages/splash/views/splash_view.dart';
import '../pages/text_to_sign/bindings/text_to_sign_binding.dart';
import '../pages/text_to_sign/views/text_to_sign_view.dart';

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
        page: () => const LoginView(),
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
    GetPage(
      name: _Paths.NEWS_DETAIL,
      page: () => NewsDetailView(),
      binding: NewsDetailBinding(),
    ),
    GetPage(
      name: _Paths.TEXT_TO_SIGN,
      page: () => TextToSignView(),
      binding: TextToSignBinding(),
    ),
    GetPage(
      name: _Paths.COURSE_DETAIL,
      page: () => const CourseDetailView(),
      binding: CourseDetailBinding(),
    ),
    GetPage(
      name: _Paths.QUIZ,
      page: () => const QuizView(),
      binding: QuizBinding(),
    ),
    GetPage(
      name: _Paths.LESSON_DETAIL,
      page: () => const LessonDetailView(),
      binding: LessonDetailBinding(),
    ),
  ];
}
