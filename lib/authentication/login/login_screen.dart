// Ignore the linting rule for mutable classes
// This allows mutable variables to be used in the class

import 'package:flutter/material.dart'; // Import the material package for Flutter UI components
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import screenutil package for responsive UI
import 'package:fluttertoast/fluttertoast.dart'; // Import fluttertoast package for showing toast messages
import 'package:ride_4_you/dashboard/driver/accept_reject_ride.dart'; // Import accept_reject_ride.dart for driver dashboard
import 'package:ride_4_you/end_ride.dart'; // Import end_ride.dart for ending the ride
import 'package:ride_4_you/authentication/forgot_password/forgot_password.dart'; // Import forgot_password.dart for password recovery
import 'package:ride_4_you/model/database.dart'; // Import database.dart for database operations
import 'package:ride_4_you/dashboard/ongoing_ride_screen.dart'; // Import ongoing_ride_screen.dart for ongoing rides
import '../../get_started_signup.dart'; // Import get_started_signup.dart for sign up screen
import '../../global_custom_widgets/custom_app_bar.dart'; // Import custom_app_bar.dart for custom app bar
import '../../global_custom_widgets/custom_large_button.dart'; // Import custom_large_button.dart for custom large button
import '../../global_custom_widgets/custom_sized_box.dart'; // Import custom_sized_box.dart for custom sized box
import '../../global_custom_widgets/custom_text_form_field.dart'; // Import custom_text_form_field.dart for custom text field

class LoginScreen extends StatefulWidget { // Define a widget for the login screen
  const LoginScreen({super.key}); // Constructor for the login screen widget
  static const String tag = "LoginScreen"; // Tag for identifying the login screen

  @override
  State<LoginScreen> createState() => _LoginScreenState(); // Create state for the login screen widget
}

class _LoginScreenState extends State<LoginScreen> { // Define the state for the login screen
  TextEditingController usernameController = TextEditingController(); // Controller for the username input field
  TextEditingController passwordController = TextEditingController(); // Controller for the password input field
  Database database = Database(); // Instance of the database class for database operations

  @override
  Widget build(BuildContext context) { // Build method to create the login screen widget
    return Scaffold( // Scaffold for the screen layout
      resizeToAvoidBottomInset: true, // Allow resizing to avoid bottom inset
      appBar: const CustomAppBarWidget(), // Custom app bar for the screen
      body: Padding( // Padding widget for adding space around the child widget
        padding: EdgeInsets.symmetric( // Padding for the content
            horizontal: MediaQuery.of(context).size.width * 0.05.w), // Horizontal padding
        child: SingleChildScrollView( // SingleChildScrollView to allow scrolling when keyboard is open
          child: Column( // Column to arrange content vertically
            mainAxisAlignment: MainAxisAlignment.center, // Align content in the center of the main axis
            children: <Widget>[ // List of children widgets
              CustomSize( // CustomSize widget for adding vertical space
                height: MediaQuery.of(context).size.height * 0.1.h, // Height of the sized box
              ),
              Image.asset( // Image widget for logo
                "assets/logo-removebg-preview.png", // Image path
                color: Colors.green, // Image color
              ),
              Padding( // Padding widget for adding space around the child widget
                padding: EdgeInsets.only(top: 12.h, bottom: 30.h), // Padding for the content
                child: Text( // Text widget for app name
                  "Ride For You ", // App name text
                  style: TextStyle( // App name text style
                      fontWeight: FontWeight.w600, // Font weight
                      color: Colors.green, // Text color
                      fontSize: 30.sp), // Font size
                ),
              ),
              Padding( // Padding widget for adding space around the child widget
                padding: EdgeInsets.only( // Padding for the content
                    bottom: MediaQuery.of(context).size.height * 0.02.h), // Padding bottom
                child: CustomTextField( // CustomTextField widget for username input
                    controller: usernameController, hintText: "Username "), // Username text field
              ),
              CustomTextField( // CustomTextField widget for password input
                controller: passwordController, // Set the controller for text input
                hintText: "Password", // Hint text for password input
                isPasswordField: true, // Set the text field as a password field
              ),
              CustomSize( // CustomSize widget for adding vertical space
                height: MediaQuery.of(context).size.height * 0.03.h, // Height of the sized box
              ),
              CustomLargeButton( // CustomLargeButton widget for login button
                title: 'Login', // Button title
                onTap: () { // Define the action when the button is tapped
                  if (usernameController.text.isEmpty || // Check if username or password is empty
                      passwordController.text.isEmpty) {
                    Fluttertoast.showToast( // Show toast message if fields are empty
                        msg: 'Please fill the above fields!');
                  } else {
                    database.signIn(context,usernameController.text, // Sign in user with provided credentials
                        passwordController.text);
                  }
                },
              ),
              CustomSize( // CustomSize widget for adding vertical space
                height: MediaQuery.of(context).size.height * 0.001.h, // Height of the sized box
              ),
              Align( // Align widget to position elements
                alignment: Alignment.bottomRight, // Align elements to the bottom right
                child: TextButton( // TextButton widget for forgot password text
                  onPressed: () { // Define the action when the button is pressed
                    onTapForgotPassword(context); // Navigate to forgot password screen
                  },
                  child: const Text( // Text widget for forgot password text
                    'Forgot password?', // Forgot password text
                    style: TextStyle(color: Colors.green), // Text style for forgot password text
                  ),
                ),
              ),
              CustomSize( // CustomSize widget for adding vertical space
                height: MediaQuery.of(context).size.height * 0.2.h, // Height of the sized box
              ),
              Row( // Row widget to arrange elements horizontally
                mainAxisAlignment: MainAxisAlignment.center, // Align elements in the center of the main axis
                children: [ // List of children widgets
                  const Text('Do not have an account?'), // Text widget for sign up message
                  GestureDetector( // GestureDetector for sign up button
                    onTap: () { // Define the action when the button is tapped
                      onTapSignUp(context); // Navigate to sign up screen
                    },
                    child: const Text( // Text widget for sign up button
                      'Sign Up', // Sign up text
                      style: TextStyle(color: Colors.green), // Text style for sign up button
                    ),
                  ),
                ],
              ),
              CustomSize( // CustomSize widget for adding vertical space
                height: 10.h, // Height of the sized box
              )
            ],
          ),
        ),
      ),
    );
  }

  onTapSignUp(BuildContext context) { // Method to handle sign up button tap
    Navigator.pushNamed(context, GetStartSignUp.tag); // Navigate to sign up screen
  }

  onTapForgotPassword(BuildContext context) { // Method to handle forgot password button tap
    Navigator.pushNamed(context, ForgotPassword.tag); // Navigate to forgot password screen
  }

  onTapUserScreens(BuildContext context) { // Method to handle user dashboard tap
    Navigator.pushNamed(context, AcceptRejectRide.tag); // Navigate to user dashboard screen
  }

  onTapEndRideScreens(BuildContext context) { // Method to handle end ride tap
    Navigator.pushNamed(context, EndRide.tag); // Navigate to end ride screen
  }

  onTapOnGoingRideScreens(BuildContext context) { // Method to handle ongoing ride tap
    Navigator.pushNamed(context, OnGoingRide.tag); // Navigate to ongoing ride screen
  }
}
