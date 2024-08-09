import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udrive/core/constants/image_constant.dart';
import 'package:udrive/core/controllers/google_signin_controller.dart';
import 'package:udrive/utils/app_colors.dart';
import 'package:udrive/utils/form_validator.dart';
import 'package:udrive/widgets/custom_elevated_button.dart';
import 'package:udrive/widgets/custom_google_apple_widget.dart';
import 'package:udrive/widgets/custom_image_view.dart';
import 'package:udrive/widgets/text_field/text_field_decoration.dart';
import 'controller/login_controller.dart';

class LoginScreen extends GetWidget<LoginController> {
  const LoginScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.outlineColor,
      body: Column(
        children: [
          Expanded(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
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
                        top: 8,
                        bottom: 8,
                        left: 5,
                        right: 10,
                      ),
                      child: CustomImageView(
                        imagePath: ImageConstant.appLogo,
                        height: 40,
                        width: 40,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Welcome Back!',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Please login first to start your Udrive',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.8,
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
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextFormField(
                          controller: controller.emailController,
                          decoration: TextFieldDecoration(
                            hintText: 'Email or phone number',
                            context: context,
                            controller: controller.emailController,
                          ).inputDecoration(),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onChanged: (val) {},
                          validator: (value) => Validator.validateEmail(value),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Obx(() {
                          return TextFormField(
                            controller: controller.passwordController,
                            obscureText: controller.isShowPassword.value,
                            decoration: TextFieldDecoration(
                              hintText: 'Input your password account',
                              context: context,
                              controller: controller.passwordController,
                              suffix: GestureDetector(
                                onTap: () {
                                  controller.isShowPassword.value =
                                      !controller.isShowPassword.value;
                                },
                                child: Icon(
                                  controller.isShowPassword.value
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: Colors.grey,
                                ),
                              ),
                            ).inputDecoration(),
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            onChanged: (val) {},
                            validator: (value) =>
                                Validator.validatePassword(value),
                          );
                        }),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Obx(() {
                                  return Checkbox(
                                    value: controller.isRememberMe.value,
                                    side: const BorderSide(
                                      color: AppColors.accent,
                                    ),
                                    activeColor: AppColors.accent,
                                    onChanged: (bool? value) {
                                      controller.isRememberMe.value =
                                          value ?? false;
                                    },
                                  );
                                }),
                                Text(
                                  'Remember Me',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(color: Colors.grey),
                                ),
                              ],
                            ),
                            Text(
                              'Forgot Password',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: Colors.grey),
                            ),
                          ],
                        ),
                        CustomElevatedButton(
                          text: 'Login',
                          onPressed: () {
                            if (controller.formKey.currentState?.validate() ??
                                false) {
                              controller.doLogin(context);
                            }
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
              ),
            ),
          )
        ],
      ),
    );
  }
}
