import 'package:flutter/material.dart';
import 'package:nutritionix/BMI_CALCULATOR/bmicalculation.dart';


Route createRotationRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const BmiCalculation(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return RotationTransition(
        turns: animation,
        child: child,
      );
    },
  );
}
