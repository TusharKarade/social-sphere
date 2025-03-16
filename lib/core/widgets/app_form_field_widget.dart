import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppFormFieldWidget extends StatelessWidget {
  final String labelText;
  final Widget? leadingIcon;
  final VoidCallback? onIconTap;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final TextInputType keyboardType;
  final bool obscureText;
  final int minLines;
  final int maxLines;
  final double? horizontalMargin;
  final String? Function(String?)? validator;

  const AppFormFieldWidget(
      {super.key,
      required this.labelText,
      this.leadingIcon,
      this.onIconTap,
      this.controller,
      this.onChanged,
      this.minLines = 1,
      this.maxLines = 4,
      this.keyboardType = TextInputType.text,
      this.horizontalMargin,
      this.obscureText = false,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: 10.h, horizontal: horizontalMargin ?? 0),
      child: TextFormField(
          controller: controller,
          onChanged: onChanged,
          autocorrect: false,
          validator: validator,
          enableSuggestions: false,
          maxLines: maxLines,
          textInputAction: TextInputAction.next,
          minLines: minLines,
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.center,
          keyboardType: keyboardType,
          obscureText: obscureText,
          decoration: InputDecoration(
            isDense: true,
            labelText: labelText,
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 0.h),
              child: leadingIcon,
            ),
          )),
    );
  }
}
