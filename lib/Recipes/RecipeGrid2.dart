import 'package:flutter/material.dart';
import 'package:nutritionix/Recipes/CategorySection.dart';
import 'package:nutritionix/Recipes/buildRecipeGrid.dart';
import 'package:nutritionix/Recipes/recipecard.dart';
import 'package:nutritionix/recipe_details/immune_support/recipedetail1.dart';
import 'package:nutritionix/recipe_details/immune_support/recipedetail2.dart';

class RecipeGrid2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildCategorySection("Immune Support"),
          Row(
            children: [
              buildRecipeGrid([
                RecipeCard(
                  title: "Grilled Chicken Salad",
                  calories: "500 Cal",
                  protein: "52g Protein",
                  imageUrl: "assets/images/grilled chicken salad.png", // Add your image URL here
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeDetail1(),
                      ),
                    );
                  },
                ),
                RecipeCard(
                  title: "Paneer High Protein Salad",
                  calories: "350 Cal",
                  protein: "22g Protein",
                  imageUrl: "assets/images/panner high protein Salad.png",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeDetail2(),
                      ),
                    );
                  },
                ),
              ]),
            ],
          ),
        ],
      ),
    );
  }
}
