import 'package:flutter/material.dart';
import 'package:nutritionix/BMI_CALCULATOR/bmicalculation.dart';

Route createScaleRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const BmiCalculation(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return ScaleTransition(
        scale: animation,
        child: child,
      );
    },
  );
}
