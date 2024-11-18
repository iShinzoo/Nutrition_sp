import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  final String title;
  final String calories;
  final String protein;
  final String imageUrl;
  final VoidCallback? onTap; // Optional callback for handling tap

  // Added const constructor since the widget is immutable
  const RecipeCard({
    Key? key,
    required this.title,
    required this.calories,
    required this.protein,
    required this.imageUrl,
    this.onTap, // Accept onTap as an optional parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get screen height and calculate the height for each card
    final double screenHeight = MediaQuery.of(context).size.height;
    final double cardHeight = screenHeight / 4; // Adjusted card height for a smaller size

    return InkWell(
      onTap: onTap, // Trigger the tap event when the card is tapped
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        child: SizedBox(
          height: cardHeight, // Set the card height dynamically
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


               ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(15.0)),


                  child: Image.asset(
                    imageUrl, // Use the passed imageUrl for each card
                    height: cardHeight * 0.45, // Adjust image height to take less space
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      // Handle any errors in case the image fails to load
                      return const Icon(
                        Icons.image_not_supported,
                        size: 60, // Reduced size for error icon
                        color: Colors.grey,
                      );
                    },
                  ),
                ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [


                    Text(
                      title,
                      style: const TextStyle(
                       // fontFamily: 'fontmain',
                        fontSize: 16, // Reduced font size for the title
                        fontWeight: FontWeight.bold, // Bold for emphasis
                        color: Colors.black87, // Dark color for better readability
                        letterSpacing: 1.2, // Slightly increased letter spacing
                      ),
                      maxLines: 2, // Allow up to two lines
                      overflow: TextOverflow.ellipsis, // Show ellipsis if it overflows
                      softWrap: true, // Enable soft wrap
                    ),


                    const SizedBox(height: 2),


                    Text(
                      calories,
                      style: const TextStyle(
                        fontFamily: 'fontmain',
                        fontSize: 12, // Reduced font size for calories
                        fontWeight: FontWeight.w600,
                        color: Colors.orangeAccent,
                          letterSpacing: 1.2// Distinctive color for calories
                      ),
                    ),


                    const SizedBox(height: 2),


                    Text(
                      protein,
                      style: const TextStyle(
                       // fontFamily: 'fontmain',
                        fontSize: 12, // Reduced font size for protein
                       fontWeight: FontWeight.w600,
                        color: Colors.green,
                          letterSpacing: 1.2// Use green to signify health/nutrition
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
