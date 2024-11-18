import 'package:flutter/material.dart';

import 'package:nutritionix/BMI_CALCULATOR/bmicalculation.dart';

import 'package:nutritionix/DASHBOARD/blogscreen.dart';
import 'package:nutritionix/DASHBOARD/dashboardscreen.dart';

void main() {
  runApp(const NUTRITIONIXAPP());
}

class NUTRITIONIXAPP extends StatelessWidget {
  const NUTRITIONIXAPP({
    super.key // Named key parameter

  }) ;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "NUTRITIONIX APP",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[100],
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
          bodyMedium: TextStyle(
            color: Colors.black54,
            fontSize: 16,
            fontWeight: FontWeight.normal,
            letterSpacing: 0.3,
          ),
        ),
      ),
      home: const BottomNavigationWidget(), // Entry point of the app
    );
  }
}

class BottomNavigationWidget extends StatefulWidget {

  const BottomNavigationWidget({super.key});
  @override
  State<StatefulWidget> createState() => BottomNavigationState();
}

class BottomNavigationState extends State<BottomNavigationWidget> {
  int selectedIndex = 0;

  // List of pages to display for each BottomNavigationBarItem
  final List<Widget> pages = [
     DashBoardScreen(),
    BlogWidget(),
    const BmiCalculation(),
  ];

  // Function to handle taps on the BottomNavigationBar
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),
     // bottomSheet: BuildTextFormField(),
      bottomNavigationBar: BottomNavigationBar(
        items: const<BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 40),
            label: "HOME",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article, size: 40),
            label: "BLOG",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate_rounded, size: 40),
            label: "BMI",
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black54,
        selectedLabelStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.black45,
        ),
        onTap: onItemTapped,
      ),
    );
  }
}