import 'package:flutter/material.dart'; // Import the material package for Flutter UI components

class CustomSize extends StatelessWidget { // Define a custom widget for a sized box
  final double? height; // Declare a nullable double variable to hold the height of the sized box
  final double? width; // Declare a nullable double variable to hold the width of the sized box

  const CustomSize({this.height, this.width, super.key}); // Constructor for the custom sized box widget

  @override
  Widget build(BuildContext context) { // Build method to create the sized box widget
    return SizedBox( // SizedBox to provide custom dimensions
      width:  width, // Set the width of the sized box
      height: height, // Set the height of the sized box
    );
  }
}
