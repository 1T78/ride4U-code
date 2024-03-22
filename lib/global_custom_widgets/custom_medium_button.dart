import 'package:flutter/material.dart'; // Import the material package for Flutter UI components
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import screenutil package for responsive UI

class CustomMediumButton extends StatelessWidget { // Define a custom widget for a medium-sized button
  final VoidCallback ontap; // Define a callback function for onTap event
  final String title; // Define a string to hold the title of the button

  const CustomMediumButton({ // Constructor for the custom button widget
    super.key, // Call the super constructor with key parameter
    required this.title, // Initialize title with required parameter
    required this.ontap, // Initialize onTap with required parameter
  });

  @override
  Widget build(BuildContext context) { // Build method to create the button widget
    return InkWell( // InkWell for tap recognition
      onTap: ontap, // Assign the onTap callback
      child: Container( // Container for button styling
        decoration: BoxDecoration( // Decoration for button
          color: Colors.green, // Set the background color to green
          borderRadius: BorderRadius.circular(20.r), // Set the border radius to 20
          boxShadow: [ // Add a shadow for depth effect
            BoxShadow(
              color: Colors.green.withOpacity(0.2), // Set shadow color with opacity
              spreadRadius: 3, // Spread radius of the shadow
              blurRadius: 5, // Blur radius of the shadow
              offset: const Offset(0, 3), // Set the offset of the shadow
            ),
          ],
        ),
        height: MediaQuery.of(context).size.height * 0.05.h, // Set the height of the button based on screen height
        width: MediaQuery.of(context).size.width * 0.38.w, // Set the width of the button based on screen width
        child: Center( // Center the button content
          child: Text( // Text widget for button title
            title, // Set the text to the provided title
            style: TextStyle( // Style for the button text
              fontWeight: FontWeight.w400, // Set text weight to normal
              color: Colors.white, // Change text color to white for better contrast
              fontSize: 12.sp, // Set font size using screenutil
            ),
          ),
        ),
      ),
    );
  }
}
