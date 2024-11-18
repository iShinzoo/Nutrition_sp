import 'package:flutter/material.dart';
import 'package:nutritionix/recipe_details/recipedetails.dart';

class RecipeDetail1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BuildDetailPage(
      imageUrl: "assets/images/paneer tikka.png", // Update the image URL
      title: "Paneer Tikka Skewers", // Update the title
      calories: "200 cal", // Update the calorie information
      ingredients:
      "• 100 grams Paneer\n"
          "• 100 grams Yogurt\n"
          "• 100 grams Bell Pepper\n"
          "• 100 grams Onion\n"
          "• 10 grams Spices", // Update ingredients
      method:
      "1. Marinate paneer and vegetables in spices and yogurt.\n"
          "2. Skewer the paneer and vegetables.\n"
          "3. Grill until charred.", // Update the method

      protein: 12, // Update protein content
      carbs: 5, // Update carb content
      fats: 14, // Update fat content
    );
  }
}
