import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_sphere/core/theme/app_colors.dart';

class AppDropdownWidget<Type> extends StatelessWidget {
  final List<Type> items;
  final Type? selectedItem;
  final String Function(Type) itemLabel;
  final ValueChanged<Type?> onChanged;
  final Widget? leadingIcon;
  final String hintText;
  final bool isExpanded;
  final double? horizontalMargin;
  const AppDropdownWidget({
    super.key,
    required this.items,
    required this.itemLabel,
    required this.onChanged,
    this.leadingIcon,
    this.selectedItem,
    this.hintText = 'Select an option',
    this.horizontalMargin,
    this.isExpanded = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: 10.h, horizontal: horizontalMargin ?? 0),
      child: DropdownButtonFormField<Type>(
        value: selectedItem,
        isExpanded: isExpanded,
        hint: Text(
          hintText,
          style: TextStyle(
              color: AppColors.editTextHintColor,
              fontWeight: FontWeight.normal,
              fontSize: 14.sp),
          textAlign: TextAlign.center,
        ),
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: 6.55.h, horizontal: 12.w),
          labelStyle: TextStyle(color: AppColors.editTextHintColor),
          prefixIcon: leadingIcon != null
              ? Padding(
                  padding: EdgeInsets.all(8.0.r),
                  child: leadingIcon,
                )
              : null,
        ),
        dropdownColor: AppColors.white,
        alignment: Alignment.centerLeft,
        menuMaxHeight: 250.h,
        icon: const SizedBox.shrink(), // Hide dropdown icon
        items: items.map((Type item) {
          return DropdownMenuItem<Type>(
              value: item,
              child: Text(
                itemLabel(item),
                style: Theme.of(context).textTheme.bodySmall,
              ));
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
