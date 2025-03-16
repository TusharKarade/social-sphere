// import 'package:flutter/material.dart';
// import 'package:upsrlm/core/theme/app_pallete.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_sphere/core/theme/app_colors.dart';

class AppTheme {
  static _textFormFieldBorder([Color borderColor = AppColors.grey]) =>
      OutlineInputBorder(
        borderSide: BorderSide(color: borderColor, width: 1.0.w),
        borderRadius: BorderRadius.circular(6.r),
      );
  static final lightThemeMode = ThemeData.light().copyWith(
      primaryColor: AppColors.appColor,
      scaffoldBackgroundColor: AppColors.white,
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
          color: AppColors.editTextHintColor,
          fontSize: 14.sp,
        ),
        floatingLabelStyle: TextStyle(
          color: AppColors.appColor,
          fontSize: 14.sp,
        ),
        enabledBorder: _textFormFieldBorder(),
        focusedBorder: _textFormFieldBorder(),
        errorBorder: _textFormFieldBorder(),
        focusedErrorBorder: _textFormFieldBorder(),
        isDense: true,
        alignLabelWithHint: true,
        hintStyle: TextStyle(
          color: AppColors.editTextHintColor,
          fontSize: 14.sp,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
        prefixIconConstraints: BoxConstraints(
          minWidth: 25.w,
          minHeight: 25.h,
        ),
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
          inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
            color: AppColors.editTextHintColor, fontWeight: FontWeight.normal),
        labelStyle: TextStyle(
            color: AppColors.editTextHintColor, fontWeight: FontWeight.normal),
      )),
      dialogTheme: DialogTheme(
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(2.r)),
        backgroundColor: AppColors.white,
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.teal_200,
        selectionColor: AppColors.teal_200,
        selectionHandleColor: AppColors.teal_200,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: AppColors.teal_200,
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          fontSize: 16.sp,
          color: AppColors.black,
          decoration: TextDecoration.none,
        ), // Default large body text
        bodyMedium: TextStyle(
          fontSize: 16.sp,
          color: AppColors.black,
          decoration: TextDecoration.none,
        ), // Default medium body text
        bodySmall: TextStyle(
          fontSize: 14.sp,
          color: AppColors.black,
          decoration: TextDecoration.none,
        ), // Default small body text
        titleLarge: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.white,
          decoration: TextDecoration.none,
        ), // Large title
        titleMedium: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.white,
          decoration: TextDecoration.none,
        ), // Medium title
        titleSmall: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.white,
          decoration: TextDecoration.none,
        ),
        labelSmall: TextStyle(
            fontSize: 11.sp,
            color: AppColors.white,
            fontWeight: FontWeight.normal),
        labelMedium: TextStyle(
            fontSize: 14.sp,
            color: AppColors.white,
            fontWeight: FontWeight.normal),
        labelLarge: TextStyle(
            fontSize: 16.sp,
            color: AppColors.white,
            fontWeight: FontWeight.normal),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(AppColors.appColor),
          shape: WidgetStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r))),
        ),
      ));
}
