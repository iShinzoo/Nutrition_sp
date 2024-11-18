import 'package:flutter/material.dart';
import 'package:nutritionix/BMI_CALCULATOR/bmicalculation.dart';



Route createSlideRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const BmiCalculation(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);  // Slide from right
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}




