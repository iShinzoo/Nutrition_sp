import 'package:flutter/material.dart';
import 'package:nutritionix/BMI_CALCULATOR/bmicalculation.dart';


Route createFadeRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const BmiCalculation(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}
