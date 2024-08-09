import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetStartedController extends GetxController with GetSingleTickerProviderStateMixin{

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

}
