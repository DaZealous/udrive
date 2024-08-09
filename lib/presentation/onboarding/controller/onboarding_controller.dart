import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:udrive/core/constants/image_constant.dart';

class OnboardingController extends GetxController {

  RxInt selectedIndex = 0.obs;

  final PageController pageController = PageController();

  List<Map<String, dynamic>> onboardings = [
    {
      'image': ImageConstant.onboarding1,
      'title': 'Make your way more comfortable',
      'subtitle': 'Find the mechanic along the entire route without interrupting your route using this platform.',
    },
    {
      'image': ImageConstant.onboarding2,
      'title': 'Solution for drivers striving for successful work',
      'subtitle': 'Be part of a new era of work with this innovative app',
    },
  ];

  get getItem => onboardings[selectedIndex.value];
}
