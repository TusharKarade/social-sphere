import 'package:flutter/material.dart';
import 'package:social_sphere/core/app_validations/validation.dart';

class EmailValidation<T> extends Validation<T> {
  @override
  String? validate(BuildContext context, T? value, String? errorMessage) {
    if (value == null || (value is String && value.trim().isEmpty)) {
      return "Email is required";
    }

    // Regular expression for validating email format
    final RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
    );

    if (value is String && !emailRegex.hasMatch(value)) {
      return "Please enter a valid email";
    }

    return null; // Valid email
  }
}
