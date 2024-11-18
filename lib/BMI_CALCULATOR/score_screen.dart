import 'package:flutter/material.dart';
import 'package:pretty_gauge/pretty_gauge.dart';

class ScoreScreen extends StatefulWidget {
  final double bmiscore;
  final int age;

  const ScoreScreen({super.key, required this.bmiscore, required this.age});
  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  String? bmiStatus;

  String? bmiInterpretation;

  Color? bmiStatusColor;

  @override
  Widget build(BuildContext context) {
    // Set BMI interpretation
    setBmiInterpretation();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:const  Text(
          "BMI SCORE",
          style:TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 30,
            shape: const RoundedRectangleBorder(),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Text(
                      "YOUR SCORE",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black45,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Pretty Gauge
                  Card(
                    elevation: 20,
                    child: PrettyGauge(
                      gaugeSize: 300,
                      minValue: 0,
                      maxValue: 40,
                      segments: [
                        GaugeSegment('UnderWeight', 18.5, Colors.red),
                        GaugeSegment('Normal', 6.4, Colors.green),
                        GaugeSegment('OverWeight', 5, Colors.orange),
                        GaugeSegment('Obesity', 10.1, Colors.pink),
                      ],
                      valueWidget: Text(
                        widget.bmiscore.toStringAsFixed(1),
                        style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      currentValue: widget.bmiscore.toDouble(),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // BMI Status
                  Text(
                    bmiStatus ?? "Unknown", // Fallback in case bmiStatus is null
                    style:TextStyle(
                        fontSize: 30,
                        color: bmiStatusColor ?? Colors.black,
                        fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  // BMI Interpretation
                  Text(
                    bmiInterpretation ?? "No interpretation available",
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),

                  const SizedBox(height: 20),

                  // Recalculate button
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // Background color
                        foregroundColor: Colors.white, // Text color
                      ),
                      child:const  Text(
                        "RE-CALCULATE",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
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

  void setBmiInterpretation() {
    if (widget.bmiscore > 30) {
      bmiStatus = "Obesity";
      bmiInterpretation = "Please work to reduce obesity.";
      bmiStatusColor = Colors.pink;
    } else if (widget.bmiscore >= 25) {
      bmiStatus = "OverWeight";
      bmiInterpretation = "Do regular exercise and reduce weight.";
      bmiStatusColor = Colors.orange;
    } else if (widget.bmiscore >= 18.5) {
      bmiStatus = "Normal";
      bmiInterpretation = "Enjoy, you are fit!";
      bmiStatusColor = Colors.green;
    } else {
      bmiStatus = "UnderWeight";
      bmiInterpretation = "Try to increase your weight.";
      bmiStatusColor = Colors.red;
    }
  }
}
