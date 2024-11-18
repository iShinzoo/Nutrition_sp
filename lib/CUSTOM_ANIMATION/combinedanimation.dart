import 'package:flutter/material.dart';

import 'package:nutritionix/BMI_CALCULATOR/bmicalculation.dart';

Route createSlideFadeRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>const BmiCalculation(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: FadeTransition(
          opacity: animation,
          child: child,
        ),
      );
    },
  );
}
