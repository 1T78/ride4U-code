// Ignore the linting rule for private types in public API
// This allows using private types like _ForgotPasswordState in public API

// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart'; // Import the material package for Flutter UI components
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import screenutil package for responsive UI
import 'package:ride_4_you/global_custom_widgets/custom_sized_box.dart'; // Import custom sized box widget
import '../../global_custom_widgets/custom_large_button.dart'; // Import custom large button widget
import '../../global_custom_widgets/custom_text_form_field.dart'; // Import custom text form field widget

class ForgotPassword extends StatefulWidget { // Define a widget for the forgot password screen
  const ForgotPassword({Key? key}) : super(key: key); // Constructor for the forgot password widget
  static const tag = "ForgotPassword"; // Tag for identifying the forgot password screen

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState(); // Create state for the forgot password widget
}

class _ForgotPasswordState extends State<ForgotPassword> { // Define the state for the forgot password screen
  final TextEditingController _phoneNumberController = TextEditingController(); // Controller for the phone number input field

  @override
  Widget build(BuildContext context) { // Build method to create the forgot password screen widget
    return Scaffold( // Scaffold for the screen layout
      body: SafeArea( // SafeArea to ensure content is displayed within safe area boundaries
        child: SingleChildScrollView( // SingleChildScrollView to allow scrolling when keyboard is open
          padding: EdgeInsets.symmetric(horizontal: 20.w), // Padding for the content
          child: Column( // Column to arrange content vertically
            mainAxisSize: MainAxisSize.min, // Set the main axis size to minimum
            children: [ // List of children widgets
              Align( // Align widget to position elements
                alignment: Alignment.topRight, // Align elements to the top right
                child: IconButton( // IconButton for close button
                  icon: const Icon(Icons.close), // Icon for close button
                  onPressed: () => Navigator.pop(context), // Pop the screen when close button is pressed
                ),
              ),
              SizedBox(height: 20.h), // SizedBox for spacing
              Align( // Align widget to position elements
                alignment: Alignment.bottomLeft, // Align elements to the bottom left
                child: Text( // Text widget for title
                  "Do you want to recover the password", // Title text
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp), // Title text style
                ),
              ),
              Padding( // Padding widget to add space around a child widget
                padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.04.h), // Padding for the content
                child: Align( // Align widget to position elements
                  alignment: Alignment.bottomLeft, // Align elements to the bottom left
                  child: Text( // Text widget for subtitle
                    "Answer the following question", // Subtitle text
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.sp), // Subtitle text style
                  ),
                ),
              ),
              Align( // Align widget to position elements
                alignment: Alignment.bottomLeft, // Align elements to the bottom left
                child: Text( // Text widget for instruction
                  "write name of your favourite Pet", // Instruction text
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp), // Instruction text style
                ),
              ),
              CustomSize( // CustomSize widget for adding vertical space
                height: MediaQuery.of(context).size.height * 0.02.h, // Height of the sized box
              ),
              _buildTextField(context, _phoneNumberController, 'Please enter your pet name '), // Custom text field widget
              Align( // Align widget to position elements
                alignment: Alignment.bottomRight, // Align elements to the bottom right
                child: GestureDetector( // GestureDetector for help text
                  onTap: () { // Define the action when the help text is tapped
                    _showHelpDialog(context); // Show help dialog
                  },
                  child: const Text( // Text widget for help text
                    'Help to recover the password?', // Help text
                    style: TextStyle(color: Colors.green), // Help text style
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.06.h), // SizedBox for spacing
              CustomLargeButton( // CustomLargeButton widget for recover button
                title: "Recover", // Button title
                onTap: () { // Define the action when the button is tapped
                  _showTeacherRegistrationDialog(context); // Show registration dialog
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showTeacherRegistrationDialog(BuildContext context) { // Method to show registration dialog
    showDialog( // Show dialog method
      context: context, // Dialog context
      builder: (BuildContext context) { // Builder for dialog content
        return AlertDialog( // AlertDialog widget for the dialog
          backgroundColor: Colors.white, // Set background color of the dialog
          title: Column( // Column for dialog title
            children: [ // List of children widgets
              Text( // Text widget for title
                "Answer is not correct", // Title text
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp), // Title text style
              ),
              Text( // Text widget for retry instruction
                'Retry', // Retry text
                style: TextStyle(color: Colors.green, fontSize: 18.sp), // Retry text style
              )
            ],
          ),
          actions: [ // List of action widgets
            Align( // Align widget to position elements
              alignment: Alignment.center, // Align elements to the center
              child: Icon( // Icon widget for emoji
                Icons.emoji_emotions, // Emoji icon
                color: Colors.yellow, // Icon color
                size: MediaQuery.of(context).size.height * 0.1.sp, // Icon size
              ),
            ),
          ],
        );
      },
    );
  }

  void _showHelpDialog(BuildContext context) { // Method to show help dialog
    showDialog( // Show dialog method
      context: context, // Dialog context
      builder: (BuildContext context) { // Builder for dialog content
        return AlertDialog( // AlertDialog widget for the dialog
          backgroundColor: Colors.white, // Set background color of the dialog
          title: Column( // Column for dialog title
            children: [ // List of children widgets
              Text( // Text widget for title
                "Please Enter the pet name you entered during signup", // Title text
                style: TextStyle(fontSize: 20.sp), // Title text style
              ),
              GestureDetector( // GestureDetector for OK button
                onTap: (){Navigator.pop(context);}, // Define the action when OK button is tapped
                child: Text( // Text widget for OK button
                  'Ok', // OK text
                  style: TextStyle(color: Colors.green, fontSize: 18.sp), // OK text style
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildTextField( // Method to create custom text field widget
    BuildContext context,
    TextEditingController controller,
    String label) {
    return Padding( // Padding widget to add space around a child widget
      padding: EdgeInsets.only(bottom: 10.h), // Padding for the content
      child: CustomTextField( // CustomTextField widget for text input
        controller: controller, // Set the controller for text input
        hintText: label, // Set the hint text for the text field
      ),
    );
  }
}
