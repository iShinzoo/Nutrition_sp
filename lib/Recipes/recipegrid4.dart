import 'package:flutter/material.dart';
import 'package:nutritionix/Recipes/CategorySection.dart';
import 'package:nutritionix/Recipes/buildRecipeGrid.dart';
import 'package:nutritionix/Recipes/recipecard.dart';
import 'package:nutritionix/recipe_details/high_protein_vegan/recipedetail1.dart';
import 'package:nutritionix/recipe_details/high_protein_vegan/recipedetail2.dart';
import 'package:nutritionix/recipe_details/high_protein_vegan/recipedetail3.dart';
import 'package:nutritionix/recipe_details/high_protein_vegan/recipedetail4.dart';
import 'package:nutritionix/recipe_details/high_protein_vegan/recipedetail5.dart';
import 'package:nutritionix/recipe_details/high_protein_vegan/recipedetail6.dart';

class RecipeGrid4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildCategorySection("High Protein and High Fiber"),
          Row(
            children: [
              buildRecipeGrid([
                RecipeCard(
                  title: "Panner Tikka Skewers",
                  calories: "200 Cal",
                  protein: "12g Protein",
                  imageUrl: "assets/images/paneer tikka.png",
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
                  title: "Tofu Scramble with Spinach and Tomatoes",
                  calories: "250 Cal",
                  protein: "18g Protein",
                  imageUrl: "assets/images/scramble.png",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeDetail2(),
                      ),
                    );
                  },
                ),
                RecipeCard(
                  title: "Soya and Chickpea Salad",
                  calories: "350 Cal",
                  protein: "22g Protein",
                  imageUrl: "assets/images/soya.png",
                  onTap: () {
                    // Navigate to the appropriate detail page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeDetail3(),
                      ),
                    );
                  },
                ),
                RecipeCard(
                  title: "Chicken and Black Bean Burrito Bowl",
                  calories: "560 Cal",
                  protein: "43g Protein",
                  imageUrl: "assets/images/black beans.png",
                  onTap: () {
                    // Navigate to the appropriate detail page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeDetail4(),
                      ),
                    );
                  },
                ),
                RecipeCard(
                  title: "Pork and Broccoli Stir-fry",
                  calories: "320 Cal",
                  protein: "35g Protein",
                  imageUrl: "assets/images/pork.png", // Ensure correct name
                  onTap: () {
                    // Navigate to the appropriate detail page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeDetail5(),
                      ),
                    );
                  },
                ),

                RecipeCard(
                  title: "Tofu and Edamame Stir-Fry",
                  calories: "450 Cal",
                  protein: "25g Protein",
                  imageUrl: "assets/images/img.png", // Ensure correct name
                  onTap: () {
                    // Navigate to the appropriate detail page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeDetail6(),
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