import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udrive/core/constants/image_constant.dart';
import 'package:udrive/routes/app_routes.dart';
import 'package:udrive/utils/app_colors.dart';
import 'package:udrive/widgets/custom_elevated_button.dart';
import 'package:udrive/widgets/custom_image_view.dart';
import 'package:udrive/widgets/custom_outlined_button.dart';
import 'controller/get_started_controller.dart';

class GetStartedScreen extends GetWidget<GetStartedController> {
  const GetStartedScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        children: [
          Expanded(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: CustomImageView(
                        imagePath: ImageConstant.globalIcon,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          padding: const EdgeInsets.only(
                              top: 8, bottom: 8, left: 5, right: 10),
                          child: CustomImageView(
                            imagePath: ImageConstant.appLogo,
                            height: 40,
                            width: 40,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'udrive',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 2.2,
            child: SlideTransition(
              position: controller.offset,
              child: Card(
                margin: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        '👋 Hello',
                        style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Choose how you will use the app for better experience',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          CustomElevatedButton(
                            text: 'I\'m a driver',
                            onPressed: () {
                              Get.toNamed(AppRoutes.onboardingScreen);
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomOutlinedButton(
                            text: 'I\'m a mechanic',
                            onPressed: () {},
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.loginScreen);
                        },
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Already have an account?',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              TextSpan(
                                text: ' Login',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: AppColors.accent,
                                      fontWeight: FontWeight.w600,
                                    ),
                              )
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
