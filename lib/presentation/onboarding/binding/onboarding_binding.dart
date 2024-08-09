import 'package:get/get.dart';
import 'package:udrive/presentation/onboarding/controller/onboarding_controller.dart';


class OnboardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardingController());
  }
}
