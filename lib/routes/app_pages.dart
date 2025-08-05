import 'package:app/bindings/login_binding.dart';
import 'package:app/bindings/result_splash_binding.dart';
import 'package:app/bindings/splash_binding.dart';
import 'package:app/views/analyzing_page.dart';
import 'package:app/views/get_started_page.dart';
import 'package:app/views/home_page.dart';
import 'package:app/views/introduction_page.dart';
import 'package:app/views/login_page.dart';
import 'package:app/views/result_page.dart';
import 'package:app/views/splash_page.dart';
import 'package:get/get.dart';
part 'routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashPage(),
      binding: SplashBinding(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 3000),
    ),
    GetPage(
      name: Routes.GETSTARTED,
      page: () => const GetStartedPage(),
      binding: null,
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginPage(),
      binding: LoginBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 100),
    ),
    GetPage(
      name: Routes.INTRODUCTION,
      page: () => const IntroductionPage(),
      binding: null,
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 100),
    ),
    GetPage(
      name: Routes.ANALYZING,
      page: () => const AnalyzingPage(),
      binding: ResultSplashBinding(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 100),
    ),
    GetPage(
      name: Routes.RESULT,
      page: () => const ResultPage(),
      binding: null,
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 100),
    ),
    GetPage(
      name: Routes.HOMEPAGE,
      page: () => const HomePage(),
      binding: null,
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 100),
    ),
  ];
}