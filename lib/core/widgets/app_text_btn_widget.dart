import 'package:flutter/material.dart';
import 'package:social_sphere/core/theme/app_colors.dart';

class AppTextBtnWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final TextStyle? textStyle;
  final Color? btnColor;
  final ButtonStyle? buttonStyle;

  const AppTextBtnWidget({
    super.key,
    required this.text,
    required this.onPressed,
    this.btnColor,
    this.textStyle,
    this.buttonStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: buttonStyle,
      onPressed: onPressed,
      child: Text(
        text,
        style: textStyle ??
            Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: btnColor ?? AppColors.appAccentColor),
      ),
    );
  }
}
