// Ignore the linting rule for private types in public API
// This allows using private types like _CustomTextFieldState in public API

// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart'; // Import the material package for Flutter UI components
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import screenutil package for responsive UI

class CustomTextField extends StatefulWidget { // Define a custom widget for a text field
  final TextEditingController controller; // Controller for handling text field input
  final String hintText; // Text to display when the text field is empty
  final Widget? prefix; // Widget to display before the input field
  final Widget? suffix; // Widget to display after the input field
  final TextInputAction textInputAction; // Specifies the action that will be triggered when the text field's keyboard action button is pressed
  final TextInputType keyboardType; // Type of keyboard to display
  final bool isPasswordField; // Indicates whether the text field is for password input
  final bool readonly; // Indicates whether the text field is read-only

  const CustomTextField({ // Constructor for the custom text field widget
    required this.controller, // Initialize controller with required parameter
    this.textInputAction = TextInputAction.next, // Initialize textInputAction with default value
    this.keyboardType = TextInputType.text, // Initialize keyboardType with default value
    required this.hintText, // Initialize hintText with required parameter
    this.prefix, // Initialize prefix with default value
    this.suffix, // Initialize suffix with default value
    this.isPasswordField = false, // Initialize isPasswordField with default value
    this.readonly = false, // Initialize readonly with default value
    super.key, // Call the super constructor with key parameter
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState(); // Create state for the custom text field
}

class _CustomTextFieldState extends State<CustomTextField> { // Define the state for the custom text field
  late bool _obscureText; // Indicates whether the text in the field should be obscured

  @override
  void initState() { // Initialize state when the widget is first created
    super.initState();
    _obscureText = widget.isPasswordField; // Initialize with true if it's a password field
  }

  @override
  Widget build(BuildContext context) { // Build method to create the text field widget
    return TextFormField( // TextFormField for text input
      readOnly: widget.readonly, // Set whether the text field is read-only
      controller: widget.controller, // Set the text editing controller

      obscureText: _obscureText, // Set whether the text is obscured
      keyboardType: widget.keyboardType, // Set the keyboard type
      textInputAction: widget.textInputAction, // Set the keyboard action

      decoration: InputDecoration( // Decoration for the text field
        hintText: widget.hintText, // Set the hint text
        hintStyle: TextStyle(color: Colors.grey, fontSize: 12.sp), // Set the style for the hint text
        prefixIcon: widget.prefix, // Set the prefix icon
        suffixIcon: widget.isPasswordField // Set the suffix icon
            ? IconButton( // IconButton to toggle password visibility
                icon: Icon( // Icon for the button
                  _obscureText ? Icons.visibility_off : Icons.visibility, // Show/hide icon based on _obscureText value
                ),
                onPressed: () { // Define the action when the button is pressed
                  setState(() { // Update the state to toggle password visibility
                    _obscureText = !_obscureText;
                  });
                },
              )
            : widget.suffix, // Set the suffix widget
        isDense: true, // Reduce the height of the text field
        contentPadding: EdgeInsets.all(12.h), // Set the padding inside the text field
        fillColor: Colors.white, // Set the fill color of the text field
        filled: true, // Enable filling of the text field background
        border: _buildBorder(), // Set the border for the text field
        enabledBorder: _buildBorder(), // Set the border when the field is enabled
        focusedBorder: _buildBorder(), // Set the border when the field is focused
      ),
    );
  }

  OutlineInputBorder _buildBorder() { // Method to create the border for the text field
    return OutlineInputBorder( // Create an outline border
      borderRadius: BorderRadius.circular(19.h), // Set the border radius
      borderSide: BorderSide( // Define the border side
        color: Colors.green, // The color of the border
        width: 1.w, // The width of the border
      ),
    );
  }
}
