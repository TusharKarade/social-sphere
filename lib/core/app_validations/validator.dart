import 'package:flutter/material.dart';
import 'package:social_sphere/core/app_validations/validation.dart';

class Validator {
  Validator._();
  static FormFieldValidator<T> apply<T>(BuildContext context,
      List<Validation<T>> validations, String? errorMessage) {
    return (T? value) {
      for (final validation in validations) {
        final error = validation.validate(context, value, errorMessage);
        if (error != null) return error;
      }
      return null;
    };
  }
}
