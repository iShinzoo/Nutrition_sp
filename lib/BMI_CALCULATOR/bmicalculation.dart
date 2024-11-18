import "dart:math";
import "package:flutter/material.dart";
import "package:nutritionix/BMI_CALCULATOR/age_weight_widget.dart";
import "package:nutritionix/BMI_CALCULATOR/gender_widget.dart";
import "package:nutritionix/BMI_CALCULATOR/height_widget.dart";
import "package:nutritionix/BMI_CALCULATOR/score_screen.dart";
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:page_transition/page_transition.dart';

class BmiCalculation extends StatefulWidget {

  const BmiCalculation({
    super.key // Named key parameter

  }) ;

  @override
  State<StatefulWidget> createState() => BmiCalculationState();
}

class BmiCalculationState extends State<BmiCalculation> {
  int gender = 0; // for gender selection
  int height = 150; // for height selection
  int age = 30; // for age selection
  int weight = 50; // for weight
  bool isFinished = false;
  double bmiScore = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, // title comes in the center
        title: const Text(
          "BMI CALCULATOR",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue, // app background color
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 12,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16), // Adding border radius for the card
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  // Calling custom widget for Gender selection
                  GenderWidget(
                    onChange: (genderVal) {
                      setState(() {
                        gender = genderVal;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  // Calling custom widget for height selection
                  HeightWidget(
                    onChange: (heightVal) {
                      setState(() {
                        height = heightVal;
                      });
                    },
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AgeWeightWidget(
                          onChange: (ageValue) {
                            setState(() {
                              age = ageValue;
                            });
                          },
                          title: "AGE",
                          initValue: age,
                          min: 0,
                          max: 100,
                        ),
                        AgeWeightWidget(
                          onChange: (weightValue) {
                            setState(() {
                              weight = weightValue; // Updating weight instead of age
                            });
                          },
                          title: "WEIGHT(Kg)",
                          initValue: weight,
                          min: 0,
                          max: 200,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
                    child: SwipeableButtonView(
                      isFinished: isFinished,
                      onFinish: () async {
                        await Navigator.push(
                          context,
                          PageTransition(
                            child: ScoreScreen(
                              bmiscore: bmiScore,
                              age: age,
                            ),
                            type: PageTransitionType.fade,
                          ),
                        );
                        setState(() {
                          isFinished = false;
                        });
                      },
                      onWaitingProcess: () {
                        // Calculate BMI here
                        calculateBmi();

                        Future.delayed(const Duration(seconds: 1), () {
                          setState(() {
                            isFinished = true;
                          });
                        });
                      },
                      activeColor: Colors.blue,
                      buttonWidget: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.black,
                      ),
                      buttonText: "CALCULATE",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // BMI calculation function
  void calculateBmi() {
    if (height > 0) {
      bmiScore = weight / pow(height / 100, 2); // Correct BMI formula
    } else {
      bmiScore = 0;
    }
  }
}
