import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udrive/utils/app_utils.dart';

class LoginController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Rx<bool> isShowPassword = true.obs;
  Rx<bool> isRememberMe = false.obs;

  final GlobalKey<FormState> formKey = GlobalKey();

  late AnimationController _animationController;
  late Animation<Offset> offset;

  @override
  void onInit() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    offset = Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero)
        .animate(_animationController);

    _animationController.forward();
    super.onInit();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void doLogin(BuildContext context) {
    showSendingData(context);
    Future.delayed(const Duration(milliseconds: 2000)).whenComplete(() {
      Get.back();
      showPopupDialogs(context, message: 'Invalid Login Details');
    });
  }
}
