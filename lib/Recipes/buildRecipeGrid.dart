import 'package:flutter/material.dart';
import 'package:nutritionix/Recipes/recipecard.dart';

Widget buildRecipeGrid(List<RecipeCard> recipes) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child:  Row(
        children: List.generate(recipes.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10.0), // Space between cards
            child: SizedBox(
              width: 180, // Fixed width for each recipe card
              child: recipes[index], // Displaying each RecipeCard
            ),
          );
        }),
      ),

  );
}
