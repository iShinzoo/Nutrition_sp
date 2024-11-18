import 'package:flutter/material.dart';
import 'package:nutritionix/DASHBOARD/image.dart';

class BuildTextFormField extends StatefulWidget {
  const BuildTextFormField({
    super.key // Named key parameter

  }) ;
  @override
  State<BuildTextFormField> createState() => BuildTextFormFieldState();
}

class BuildTextFormFieldState extends State<BuildTextFormField> {
  var text = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // TextFormField wrapped in a Card with elevation
          Expanded(
            child: Card(
              elevation: 4, // Shadow effect for depth
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30), // Rounded corners
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), // Rounded corners
                ),
                child: TextFormField(
                  controller: text,
                  decoration: InputDecoration(
                    hintText: "Add Your Meal",
                    hintStyle: TextStyle(
                      color: Colors.grey[500], // Hint text color
                    ),
                    suffixStyle: const TextStyle(
                      color: Colors.black45,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide:const  BorderSide(
                        color: Colors.orangeAccent,
                        width: 2, // Thicker border on focus
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide:const BorderSide(
                        color: Colors.blueAccent,
                        width: 1.5, // Thinner border when enabled
                      ),
                    ),
                    contentPadding:const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 20,
                    ), // Padding inside the text field
                  ),
                ),
              ),
            ),
          ),

          // Space between text field and button
          const SizedBox(width: 8),

          // Camera icon button
            IconButton(
                splashColor: Colors.transparent, // Disable ripple effect
                highlightColor: Colors.transparent, // Disable highlight effect
                icon: const Icon(Icons.camera_alt),
                iconSize: 50,
                color: Colors.blue, // White icon color for contrast
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>ScannerPage(cameras)));

                  // Add your action here
                },
              ),


        ],
      ),
    );
  }
}
