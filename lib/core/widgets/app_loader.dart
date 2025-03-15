import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_sphere/core/theme/app_colors.dart';

class AppLoader {
  String? message;
  AppLoader(this.message);
  static void show(BuildContext context, {String? message}) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing by tapping outside
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          contentPadding: EdgeInsets.all(10.r),
          backgroundColor: AppColors.white,
          content: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 15.w),
              // Text(message ?? AppLocalizations.of(context)!.pleaseWaitText,
              //     style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        );
      },
    );
  }

  static void hide(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }
}
