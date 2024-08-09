import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udrive/core/constants/image_constant.dart';
import 'package:udrive/core/controllers/google_signin_controller.dart';
import 'package:udrive/routes/app_routes.dart';
import 'package:udrive/utils/app_colors.dart';
import 'package:udrive/widgets/custom_elevated_button.dart';
import 'package:udrive/widgets/custom_google_apple_widget.dart';
import 'package:udrive/widgets/custom_image_view.dart';
import 'controller/drive_start_controller.dart';

class DriveStartScreen extends GetWidget<DriveStartController> {
  const DriveStartScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.accent,
      body: Stack(
        children: [
          CustomImageView(
            imagePath: ImageConstant.truckImage,
            height: MediaQuery.of(context).size.height / 1.6,
            width: double.infinity,
          ),
          Column(
            children: [
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 2.2,
                child: Card(
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
                          'Your Successful Journey Starts Here',
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
                          'Choose how you will use the app for better experience',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomElevatedButton(
                          text: 'Login to Account',
                          onPressed: () {
                            Get.toNamed(AppRoutes.loginScreen);
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomGoogleAndAppleWidget(
                          onGoogleTap: (){
                            GoogleSignInController.initiateGoogleAuth();
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            // Get.offAllNamed(AppRoutes.signUpScreen);
                          },
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'New to udrive?',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                TextSpan(
                                  text: ' Create Account',
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
              )
            ],
          ),
        ],
      ),
    );
  }
}
