import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_sphere/core/theme/app_colors.dart';

class AppFooterWidget extends StatelessWidget {
  final bool showUpsrlmLogo;
  const AppFooterWidget({super.key, this.showUpsrlmLogo = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: showUpsrlmLogo ? 147.h : 57.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (showUpsrlmLogo)
            Image.asset(
              'assets/icons/watermark_logo.png',
              color: AppColors.black.withAlpha(80),
              colorBlendMode: BlendMode.dstIn,
              height: 90.h,
              width: 90.w,
            ),
          SizedBox(height: 5.h),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    AppColors.appColor,
                    AppColors.c1,
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Container(
                  //   alignment: Alignment.topCenter,
                  //   padding:
                  //       EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.h),
                  //   child: FittedBox(
                  //     child: Text(AppLocalizations.of(context)!.footerText,
                  //         textAlign: TextAlign.center,
                  //         style: Theme.of(context).textTheme.labelSmall),
                  //   ),
                  // ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
