import 'package:flutter/material.dart';

class AgeWeightWidget extends StatefulWidget {
  final Function(int) onChange;
  final String title;
  final int initValue;
  final int min;
  final int max;

  const AgeWeightWidget({
    super.key, // This directly initializes the key in the super constructor
    required this.onChange,
    required this.title,
    required this.initValue,
    required this.min,
    required this.max,
  });


  @override
  State<StatefulWidget> createState() => AgeWeightState();
}

class AgeWeightState extends State<AgeWeightWidget> {
  int counter = 0;

  @override
  void initState() {
    super.initState();
    counter = widget.initValue; // Initializing the counter with the passed initial value
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Adding border radius
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.black45,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: const CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.remove, color: Colors.white),
                    ),
                    onTap: () {
                      setState(() {
                        if (counter > widget.min) {
                          counter--; // Decrease the counter
                        }
                      });
                      widget.onChange(counter); // Call the onChange callback
                    },
                  ),
                  const SizedBox(width: 15),
                  Text(
                    counter.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 30),
                  InkWell(
                    child: const CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.add, color: Colors.white),
                    ),
                    onTap: () {
                      setState(() {
                        if (counter < widget.max) {
                          counter++; // Increase the counter
                        }
                      });
                      widget.onChange(counter); // Call the onChange callback
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
