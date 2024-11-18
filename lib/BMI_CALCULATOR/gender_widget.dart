import 'package:flutter/material.dart';
import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';

class GenderWidget extends StatefulWidget {
  final Function(int) onChange;

  const GenderWidget({super.key, required this.onChange});


  @override
  State<StatefulWidget> createState() => GenderState();
}

class GenderState extends State<GenderWidget> {
  int gender = 0;

  // For making the choice
  final ChoiceChip3DStyle selectedStyle = ChoiceChip3DStyle(
    topColor: Colors.black38,
    backColor: Colors.grey,
    borderRadius: BorderRadius.circular(20),
  );

  final ChoiceChip3DStyle unselectedStyle = ChoiceChip3DStyle(
    topColor: Colors.white,
    backColor: Colors.grey[300]!,
    borderRadius: BorderRadius.circular(20),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // For center alignment
        children: [
          // Male Choice Chip
          ChoiceChip3D(
            border: Border.all(color: Colors.black45),
            style: gender == 1 ? selectedStyle : unselectedStyle,
            onSelected: () {
              setState(() {
                gender = 1; // Male selected
              });
              widget.onChange(gender);
            },
            onUnSelected: () {},
            selected: gender == 1,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/male.png",
                  width: 50,
                ),
                const SizedBox(height: 5),
                const Text(
                  "MALE",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(width: 50),

          // Female Choice Chip
          ChoiceChip3D(
            border: Border.all(color: Colors.grey),
            style: gender == 2 ? selectedStyle : unselectedStyle,
            onSelected: () {
              setState(() {
                gender = 2; // Female selected
              });
              widget.onChange(gender);
            },
            onUnSelected: () {},
            selected: gender == 2,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/female.png",
                  width: 40,
                ),
                const SizedBox(height: 5),
                const Text(
                  "FEMALE",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
