import 'package:flutter/material.dart';
import 'package:nutritionix/Recipes/CategorySection.dart';
import 'package:nutritionix/Recipes/buildRecipeGrid.dart';
import 'package:nutritionix/Recipes/recipecard.dart';
import 'package:nutritionix/recipe_details/others/recipedetail1.dart';
import 'package:nutritionix/recipe_details/others/recipedetail2.dart';
import 'package:nutritionix/recipe_details/others/recipedetail3.dart';
import 'package:nutritionix/recipe_details/others/recipedetail4.dart';
import 'package:nutritionix/recipe_details/others/recipedetail5.dart';
import 'package:nutritionix/recipe_details/others/recipedetail6.dart';

class RecipeGrid3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildCategorySection("Others"),
          Row(
            children: [
              buildRecipeGrid([
                RecipeCard(
                  title: "Spinach and Ricotta Stuffed Shells",
                  calories: "420 Cal",
                  protein: "24g Protein",
                  imageUrl: "assets/images/spinach.png",
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
                  title: "Vegetable Stir Fry With Tofu",
                  calories: "360 Cal",
                  protein: "21g Protein",
                  imageUrl: "assets/images/tofu.png",
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
                  title: "Chicken and Spinach Curry",
                  calories: "250 Cal",
                  protein: "9g Protein",
                  imageUrl: "assets/images/chickenpea.png",
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
                  title: "Mushroom and Zucchini Lasagna",
                  calories: "320 Cal",
                  protein: "22g Protein",
                  imageUrl: "assets/images/mushroom.png",
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
                  title: "Butternut Squash Soup",
                  calories: "150 Cal",
                  protein: "2g Protein",
                  imageUrl: "assets/images/butternut squash soup.png", // Ensure correct name
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
                  title: "Egg White and Spinach Omelette",
                  calories: "150 Cal",
                  protein: "20g Protein",
                  imageUrl: "assets/images/eggwhite.png", // Ensure correct name
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