import "package:flutter/material.dart";
import 'package:nutritionix/BMI_CALCULATOR/bmicalculation.dart';

// This screen shows a blue background for a short time and then navigates to the next screen
class BlueTransitionScreen extends StatefulWidget {

  // Constructor with named 'key' parameter.
  const BlueTransitionScreen({
    super.key // Named key parameter

  }) ;

  @override
  BlueTransitionScreenState createState() => BlueTransitionScreenState();
}

class BlueTransitionScreenState extends State<BlueTransitionScreen> {
  @override
  void initState() {
    super.initState();

    // Add a delay before navigating to the next screen
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const BmiCalculation()),
        );
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue, // Blue background color
        child: const Center(
          child: Text(
            'Loading...',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      ),
    );
  }
}