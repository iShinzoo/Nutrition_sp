import 'package:flutter/material.dart';

Widget buildCategorySection(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
    child: Text(
      title,
      style: TextStyle(
       // fontFamily:"quicksand" ,
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        letterSpacing: 1.2,

      ),
    ),
  );
}
