import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nutritionix/DASHBOARD/INPUT_WIDGET.dart';
import 'package:nutritionix/DASHBOARD/sidebar.dart';
import 'package:nutritionix/Recipes/RecipeGrid.dart';
import 'package:nutritionix/Recipes/RecipeGrid2.dart';
import 'package:nutritionix/Recipes/recipegrid3.dart';
import 'package:nutritionix/Recipes/recipegrid4.dart';

class DashBoardScreen extends StatelessWidget {
  // Moved the GlobalKey to be within the constructor of DashBoardScreen
  DashBoardScreen({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey, // Assign the key to the Scaffold
      drawer: Drawer(
        child: Sidebar(), // Assuming Sidebar is a widget that builds the drawer's content
      ),
      body: Column(
        children: [
          const SizedBox(height: 15),
          // Fixed top widget
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/name.png'),
                    ),
                    onTap: () {
                      scaffoldKey.currentState?.openDrawer(); // Open the drawer
                    },
                  ),
                ),
                const Spacer(),
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(
                          width: 2,
                          color: Colors.blueAccent,
                        ),
                        gradient: const LinearGradient(
                          colors: [Colors.blueAccent, Colors.lightBlue],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.crown,
                              size: 30.0,
                              color: Colors.amberAccent,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Get Premium",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          // Scrollable content area
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  // Horizontal scrolling for Recipe Grids
                  buildHorizontalRecipeGrid(RecipeGrid1()),
                  buildHorizontalRecipeGrid(RecipeGrid4()),
                  buildHorizontalRecipeGrid(RecipeGrid3()),
                  buildHorizontalRecipeGrid(RecipeGrid2()),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomSheet: const BuildTextFormField(),
    );
  }

  Widget buildHorizontalRecipeGrid(Widget recipeGrid) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          child: recipeGrid,
        ),
      ),
    );
  }
}
