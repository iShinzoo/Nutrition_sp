import 'package:flutter/material.dart';
import 'package:nutritionix/Recipes/CategorySection.dart';
import 'package:nutritionix/Recipes/buildRecipeGrid.dart';
import 'package:nutritionix/Recipes/recipecard.dart';
import 'package:nutritionix/recipe_details/poultary_based_recipe/recipedetail1.dart';
import 'package:nutritionix/recipe_details/poultary_based_recipe/recipedetail2.dart';
import 'package:nutritionix/recipe_details/poultary_based_recipe/recipedetail1.dart';
import 'package:nutritionix/recipe_details/poultary_based_recipe/recipedetail2.dart';
import 'package:nutritionix/recipe_details/poultary_based_recipe/recipedetail3.dart';
import 'package:nutritionix/recipe_details/poultary_based_recipe/recipedetail4.dart';
import 'package:nutritionix/recipe_details/poultary_based_recipe/recipedetail5.dart';


class RecipeGrid1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildCategorySection("Poultry-Based Recipes"),
        SingleChildScrollView(
          child: Row(
            children: [
              buildRecipeGrid([
                RecipeCard(
                  title: "Grilled Chicken Salad",
                  calories: "500 Cal",
                  protein: "52g Protein",
                  imageUrl: "assets/images/grilled chicken salad.png",
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
                  title: "Chicken and Broccoli Stir Fry",
                  calories: "300 Cal",
                  protein: "35g Protein",
                  imageUrl: "assets/images/chicken and broccoli stir fry.png",
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
                  title: "Thai Peanut Chicken Stir Fry",
                  calories: "580 Cal",
                  protein: "36g Protein",
                  imageUrl: "assets/images/thai peanut chicken stir fry.png",
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
                  title: "Broccoli and Chicken Casserole",
                  calories: "300 Cal",
                  protein: "35g Protein",
                  imageUrl: "assets/images/broccoli and chicken casser.png",
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
                  title: "Grilled Chicken and Quinoa Salad",
                  calories: "560 Cal",
                  protein: "52g Protein",
                  imageUrl: "assets/images/grilled chicken and quinoa salad.png", // Ensure correct name
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
              ]),
            ],
          ),
        ),
      ],
    );

  }
}