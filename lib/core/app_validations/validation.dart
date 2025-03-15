import 'package:flutter/material.dart';

abstract class Validation<T> {
  const Validation();
  //Validates the given value and returns an error message if validation fails
  //
  // If validation passes, it should return null
  String? validate(BuildContext context, T? value, String? errorMessage);
}
