import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_sphere/core/theme/app_colors.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool showBackButton;
  final VoidCallback? leadingBtnOnClick;
  final List<Widget>? actions;
  const AppBarWidget({
    super.key,
    this.title,
    this.showBackButton = false,
    this.leadingBtnOnClick,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: AppBar(
        automaticallyImplyLeading: false,
        title: FittedBox(
          child: Text(title ?? "Social Sphere",
              style: Theme.of(context).textTheme.titleLarge),
        ),
        leading: showBackButton
            ? IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: leadingBtnOnClick,
                iconSize: 18.sp,
                color: AppColors.white,
              )
            : null,
        actions: actions,
        backgroundColor: Colors.transparent,
        elevation: 0, // No shadow
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
