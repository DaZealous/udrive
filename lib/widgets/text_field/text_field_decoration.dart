import 'package:flutter/material.dart';
import 'package:udrive/utils/app_colors.dart';

class TextFieldDecoration {
  final FocusNode? focusNode;
  final TextEditingController controller;
  final Function()? onClearTap;
  final String hintText;
  final String? helperText;
  final BuildContext context;
  final bool removeClear;
  final Widget? prefix;
  final double clearSize;
  final int? helperMaxLines;
  final TextStyle? helperTextStyle;
  final Widget? suffix;
  final int hintMaxLines;
  final bool centerHintText;
  final String? counterText;

  TextFieldDecoration(
      {
        this.focusNode,
        required this.controller,
        this.onClearTap,
        required this.hintText,
        required this.context,
        this.removeClear = false,
        this.clearSize = 10,
        this.hintMaxLines = 10,
        this.prefix,
        this.helperText,
        this.helperMaxLines,
        this.helperTextStyle,
        this.centerHintText = false,
        this.suffix,
        this.counterText,
      });

  InputDecoration inputDecoration() {
    return InputDecoration(
        counterText: counterText,
        errorStyle: const TextStyle(color: Colors.red),
        // filled: true,
        prefixIcon: prefix,
        border: OutlineInputBorder(
          borderSide:
          const BorderSide(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(30.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
          const BorderSide(color: AppColors.accent, width: 1),
          borderRadius: BorderRadius.circular(30.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide:
          const BorderSide(color: AppColors.accent, width: 1),
          borderRadius: BorderRadius.circular(30.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1),
          borderRadius: BorderRadius.circular(30.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
          const BorderSide(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(30.0),
        ),
        // fillColor: (focusNode?.hasFocus ?? false) || controller.text.isNotEmpty
        //     ? AppColors.kAccentColor2
        //     : Colors.white,
        suffixIcon: suffix,
        suffix: removeClear || onClearTap == null
            ? null
            : InkWell(
            onTap: onClearTap,
            borderRadius: BorderRadius.circular(24),
            child: CircleAvatar(
              radius: clearSize,
              backgroundColor: AppColors.accent,
              child: Icon(
                Icons.close,
                size: clearSize + 2,
                color: Colors.white,
              ),
            )),
        hintText: centerHintText ? hintText : null,
        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: AppColors.accent,
        ),
        labelText: !centerHintText ? hintText : null,
        helperText: helperText,
        helperMaxLines: helperMaxLines,
        hintMaxLines: hintMaxLines,
        helperStyle: helperTextStyle,
        labelStyle: Theme.of(context).textTheme.bodyMedium,
        contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0)
      // labelText: hintText,
    );
  }
}
