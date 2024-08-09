import 'package:flutter/material.dart';
import 'package:udrive/core/constants/image_constant.dart';
import 'custom_image_view.dart';
import 'custom_outlined_button.dart';

class CustomGoogleAndAppleWidget extends StatelessWidget{
  const CustomGoogleAndAppleWidget({super.key, this.onGoogleTap});

  final Function()? onGoogleTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomOutlinedButton(
            onPressed: onGoogleTap,
            text: 'Google',
            leftIcon: CustomImageView(
              imagePath: ImageConstant.googleIcon,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: CustomOutlinedButton(
            text: 'Apple',
            leftIcon: CustomImageView(
              imagePath: ImageConstant.appleIcon,
            ),
          ),
        ),
      ],
    );
  }

}