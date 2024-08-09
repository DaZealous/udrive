import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:udrive/core/constants/image_constant.dart';
import 'package:udrive/routes/app_routes.dart';
import 'package:udrive/utils/app_colors.dart';
import 'package:udrive/widgets/custom_image_view.dart';
import 'controller/onboarding_controller.dart';

class OnboardingScreen extends GetWidget<OnboardingController> {
  const OnboardingScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: controller.selectedIndex.value == 0
            ? AppColors.accent
            : Colors.white,
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 1.5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: PageView.builder(
                      itemCount: controller.onboardings.length,
                      controller: controller.pageController,
                      onPageChanged: (index) {
                        controller.selectedIndex.value = index;
                      },
                      itemBuilder: (context, index) {
                        return Obx(() {
                          return controller.selectedIndex.value == 0
                              ? Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.only(top: 100.0),
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: CustomImageView(
                                          imagePath:
                                              controller.getItem['image'],
                                        ),
                                      ),
                                      Positioned(
                                        right: 60,
                                        top: 200,
                                        child: RotationTransition(
                                          turns: const AlwaysStoppedAnimation(
                                              15 / 360),
                                          child: Text(
                                            '😎',
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayLarge,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 60,
                                        top: 150,
                                        child: RotationTransition(
                                          turns: const AlwaysStoppedAnimation(
                                              345 / 360),
                                          child: Text(
                                            '🤩',
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayLarge,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                          right: 30,
                                          top: 30,
                                          child: CustomImageView(
                                            imagePath: ImageConstant.logoBubble,
                                          )),
                                    ],
                                  ),
                                )
                              : SafeArea(
                                  child: CustomImageView(
                                    margin: const EdgeInsets.only(bottom: 80),
                                    imagePath: controller.getItem['image'],
                                    width: double.infinity,
                                    fit: BoxFit.fitHeight,
                                  ),
                                );
                        });
                      }),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 2.2,
                child: Card(
                  color: Colors.white,
                  surfaceTintColor: Colors.white,
                  margin: EdgeInsets.zero,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          controller.getItem['title'] ?? '',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          controller.getItem['subtitle'] ?? '',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (controller.selectedIndex.value ==
                                controller.onboardings.length - 1) {
                              Get.toNamed(AppRoutes.driveStartScreen);
                              return;
                            }
                            controller.pageController.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut);
                          },
                          child: Obx(() {
                            return CircularPercentIndicator(
                              radius: 50.0,
                              lineWidth: 2.0,
                              animation: true,
                              animateFromLastPercent: true,
                              percent: (controller.selectedIndex.value + 1) /
                                  controller.onboardings.length,
                              center: Container(
                                margin: const EdgeInsets.all(10),
                                padding: const EdgeInsets.all(20),
                                decoration: const BoxDecoration(
                                    color: AppColors.outlineColor,
                                    shape: BoxShape.circle),
                                child: const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                ),
                              ),
                              progressColor: AppColors.outlineColor,
                            );
                          }),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
