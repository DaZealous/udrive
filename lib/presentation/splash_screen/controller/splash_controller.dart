import 'package:get/get.dart';
import 'package:udrive/routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    Future.delayed(const Duration(milliseconds: 6000), () {
      Get.toNamed(AppRoutes.getStartedScreen, );
    });
  }
}
