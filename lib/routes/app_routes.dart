import 'package:get/get.dart';
import 'package:udrive/presentation/drive_start_screen/binding/drive_start_binding.dart';
import 'package:udrive/presentation/drive_start_screen/drive_start_screen.dart';
import 'package:udrive/presentation/get_started/binding/get_started_binding.dart';
import 'package:udrive/presentation/get_started/get_started_screen.dart';
import 'package:udrive/presentation/login_screen/binding/login_binding.dart';
import 'package:udrive/presentation/login_screen/login_screen.dart';
import 'package:udrive/presentation/onboarding/binding/onboarding_binding.dart';
import 'package:udrive/presentation/onboarding/onboarding_screen.dart';
import 'package:udrive/presentation/splash_screen/binding/splash_binding.dart';
import 'package:udrive/presentation/splash_screen/splash_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String getStartedScreen = '/get_started_screen';
  static const String onboardingScreen = '/onboarding_screen';
  static const String driveStartScreen = '/drive_start_screen';
  static const String loginScreen = '/login_screen';

  static List<GetPage> pages = [
    GetPage(
      name: splashScreen,
      page: () => const SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: getStartedScreen,
      page: () => const GetStartedScreen(),
      bindings: [
        GetStartedBinding(),
      ],
    ),
    GetPage(
      name: onboardingScreen,
      transition: Transition.fadeIn,
      page: () => const OnboardingScreen(),
      bindings: [
        OnboardingBinding(),
      ],
    ),
    GetPage(
      name: driveStartScreen,
      transition: Transition.fadeIn,
      page: () => const DriveStartScreen(),
      bindings: [
        DriveStartBinding(),
      ],
    ),
    GetPage(
      name: loginScreen,
      transition: Transition.fadeIn,
      page: () => const LoginScreen(),
      bindings: [
        LoginBinding(),
      ],
    ),
  ];
}
