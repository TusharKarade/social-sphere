import 'package:flutter/material.dart';

class AppFormFieldWithoutBorder extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final Function(String)? onChanged;
  final Widget? suffixIcon;
  final TextStyle? style;

  const AppFormFieldWithoutBorder(
      {super.key,
      required this.controller,
      this.hintText,
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      this.onChanged,
      this.suffixIcon,
      this.style});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: onChanged,
      style: style, // Optional hint styling
      decoration: InputDecoration(
        hintText: hintText,
        border: InputBorder.none, // No border in any state
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        suffixIcon: suffixIcon,
        contentPadding: EdgeInsets.symmetric(
            vertical: 8, horizontal: 10), // Adjust padding if needed
      ),
    );
  }
}
