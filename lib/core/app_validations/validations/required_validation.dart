import 'package:flutter/material.dart';
import 'package:social_sphere/core/app_validations/validation.dart';

class RequiredValidation<T> extends Validation<T> {
  @override
  String? validate(BuildContext context, T? value, String? errorMessage) {
    if (value == null || (value is String && value.trim().isEmpty)) {
      return errorMessage ?? "This field is required";
    }
    return null; // Valid input
  }
}
