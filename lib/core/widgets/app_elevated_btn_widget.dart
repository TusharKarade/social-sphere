import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppElevatedBtnWidget extends StatelessWidget {
  const AppElevatedBtnWidget(
      {super.key,
      required this.text,
      required this.onPressed,
      this.btnWidth,
      this.btnStyle,
      this.btnHeight});
  final double? btnWidth;
  final double? btnHeight;
  final String text;
  final VoidCallback? onPressed;
  final ButtonStyle? btnStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: btnWidth ?? 200.w,
      height: btnHeight ?? 40.h,
      child: ElevatedButton(
          onPressed: onPressed,
          style: btnStyle,
          child: Text(text, style: Theme.of(context).textTheme.labelLarge)),
    );
  }
}
