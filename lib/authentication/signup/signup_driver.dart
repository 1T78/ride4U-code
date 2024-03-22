// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart'; // Import the Flutter Material package
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import the flutter_screenutil package for responsive UI
import 'package:fluttertoast/fluttertoast.dart'; // Import the fluttertoast package for showing toast messages
import 'package:ride_4_you/model/database.dart'; // Import the database.dart file for database operations

import '../../global_custom_widgets/custom_large_button.dart'; // Import the custom_large_button.dart file for custom large button
import '../../global_custom_widgets/custom_medium_button.dart'; // Import the custom_medium_button.dart file for custom medium button
import '../../global_custom_widgets/custom_text_form_field.dart'; // Import the custom_text_form_field.dart file for custom text form field

class SignUpDriver extends StatefulWidget { // Define a widget for signing up as a driver
  const SignUpDriver({Key? key}) : super(key: key); // Constructor for the sign-up driver widget
  static const tag = "SignupDriver"; // Tag for identifying the sign-up driver screen

  @override
  _SignUpDriverState createState() => _SignUpDriverState(); // Create state for the sign-up driver widget
}

class _SignUpDriverState extends State<SignUpDriver> { // Define the state for the sign-up driver screen
  final TextEditingController _emailController = TextEditingController(); // Controller for the email input field
  final TextEditingController _usernameController = TextEditingController(); // Controller for the username input field
  final TextEditingController _passwordController = TextEditingController(); // Controller for the password input field
  final TextEditingController _confirmPasswordController = TextEditingController(); // Controller for the confirm password input field
  final TextEditingController _favoritePetController = TextEditingController(); // Controller for the favorite pet input field
  final TextEditingController _phoneNumberController = TextEditingController(); // Controller for the phone number input field
  final TextEditingController _vehicalNameController = TextEditingController(); // Controller for the vehicle name input field
  Database database = Database(); // Instance of the Database class for database operations
  String _role = ''; // Variable to store the role of the user
  String _vehicleType = ''; // Variable to store the type of vehicle
  String _registrationNumber = ''; // Variable to store the registration number
  final TextEditingController _studentidController = TextEditingController(); // Controller for the student ID input field
  final TextEditingController _employeeidController = TextEditingController(); // Controller for the employee ID input field

  @override
  Widget build(BuildContext context) { // Build method to create the sign-up driver screen widget
    return Scaffold( // Scaffold widget for the screen layout
      body: SafeArea( // SafeArea widget to ensure content is displayed within safe areas
        child: SingleChildScrollView( // SingleChildScrollView to allow scrolling when keyboard is open
          padding: EdgeInsets.symmetric(horizontal: 20.w), // Padding for the content
          child: Column( // Column to arrange content vertically
            mainAxisSize: MainAxisSize.min, // Set the main axis size to minimum
            children: [ // List of children widgets
              Align( // Align widget to position elements
                alignment: Alignment.topRight, // Align elements to the top right
                child: IconButton( // IconButton widget for close button
                  icon: const Icon(Icons.close), // Close icon
                  onPressed: () => Navigator.pop(context), // Close action
                ),
              ),
              Text( // Text widget for app name
                "Ride For You ", // App name text
                style: TextStyle( // App name text style
                    fontWeight: FontWeight.w600, // Font weight
                    color: Colors.green, // Text color
                    fontSize: 32.sp), // Font size
              ),
              SizedBox(height: 20.h), // SizedBox widget for adding vertical space
              _buildTextField(context, _usernameController, 'Username'), // Custom text field for username input
              _buildTextField(context, _emailController, 'Email'), // Custom text field for email input
              _buildTextField(context, _passwordController, 'Password', // Custom text field for password input
                  isPassword: true), // Set as password field
              _buildTextField( // Custom text field for favorite pet input
                  context, _favoritePetController, 'Your Favorite pet name'),
              _buildTextField( // Custom text field for confirm password input
                  context, _confirmPasswordController, 'Confirm Password', // Confirm password text
                  isPassword: true), // Set as password field
              _buildTextField(context, _vehicalNameController, 'Vehicle Name'), // Custom text field for vehicle name input
              _buildTextField( // Custom text field for phone number input
                  context, _phoneNumberController, 'Enter phone number'),
              const Align( // Align widget to position elements
                  alignment: Alignment.bottomLeft, // Align elements to the bottom left
                  child: Text( // Text widget for vehicle type selection
                    "Select vehicle Type ", // Vehicle type selection text
                    style: TextStyle(fontWeight: FontWeight.bold), // Text style for vehicle type selection
                  )),
              Row( // Row widget to arrange elements horizontally
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Align elements with equal space between them
                children: [ // List of children widgets
                  Radio<String>( // Radio widget for selecting bike vehicle type
                    value: 'Bike', // Value for bike
                    groupValue: _vehicleType, // Current selected value
                    onChanged: (value) { // Define action when value changes
                      if (value != null) { // Check if value is not null
                        setState(() { // Set state to update UI
                          _vehicleType = value; // Update vehicle type value
                        });
                      }
                    },
                  ),
                  const Text('Bike'), // Text widget for bike
                  Radio<String>( // Radio widget for selecting car vehicle type
                    value: 'Car', // Value for car
                    groupValue: _vehicleType, // Current selected value
                    onChanged: (value) { // Define action when value changes
                      if (value != null) { // Check if value is not null
                        setState(() { // Set state to update UI
                          _vehicleType = value; // Update vehicle type value
                        });
                      }
                    },
                  ),
                  const Text('Car'), // Text widget for car
                  const Divider() // Divider widget for separation
                ],
              ),
              const Align( // Align widget to position elements
                  alignment: Alignment.bottomLeft, // Align elements to the bottom left
                  child: Text( // Text widget for role selection
                    "Role In University", // Role selection text
                    style: TextStyle(fontWeight: FontWeight.bold), // Text style for role selection
                  )),
              Row( // Row widget to arrange elements horizontally
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Align elements with equal space between them
                children: [ // List of children widgets
                  Radio<String>( // Radio widget for selecting student role
                    value: 'student', // Value for student
                    groupValue: _role, // Current selected value
                    onChanged: (value) { // Define action when value changes
                      if (value != null) { // Check if value is not null
                        setState(() { // Set state to update UI
                          _role = value; // Update role value
                          _studentidController.clear(); // Clear student ID controller
                          _showStudentRegistrationDialog(context); // Show student registration dialog
                        });
                      }
                    },
                  ),
                  const Text('Student'), // Text widget for student
                  Radio<String>( // Radio widget for selecting teacher role
                    value: 'teacher', // Value for teacher
                    groupValue: _role, // Current selected value
                    onChanged: (value) { // Define action when value changes
                      if (value != null) { // Check if value is not null
                        setState(() { // Set state to update UI
                          _role = value; // Update role value
                          _employeeidController.clear(); // Clear employee ID controller
                          _showTeacherRegistrationDialog(context); // Show teacher registration dialog
                        });
                      }
                    },
                  ),
                  const Text('Teacher'), // Text widget for teacher
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02.h), // SizedBox widget for adding vertical space
              CustomLargeButton( // Custom large button for sign up
                  title: "Save and Signup", // Button title
                  onTap: () { // Define action on button tap
                    if (_usernameController.text.isEmpty || // Check if username is empty
                        _emailController.text.isEmpty || // Check if email is empty
                        _passwordController.text.isEmpty || // Check if password is empty
                        _confirmPasswordController.text.isEmpty || // Check if confirm password is empty
                        _favoritePetController.text.isEmpty || // Check if favorite pet is empty
                        _registrationNumber == '' || // Check if registration number is empty
                        _vehicleType == '' || // Check if vehicle type is empty
                        _phoneNumberController.text.isEmpty || // Check if phone number is empty
                        _vehicalNameController.text.isEmpty) { // Check if vehicle name is empty
                      Fluttertoast.showToast( // Show toast message if fields are empty
                          msg: 'Please fill the above fields!');
                    } else { // If all fields are filled
                      database.driverDetailsToFirestore( // Add driver details to Firestore
                        context, // Build context
                        _usernameController.text, // Username
                        _emailController.text, // Email
                        _passwordController.text, // Password
                        _favoritePetController.text, // Favorite pet
                        _vehicalNameController.text, // Vehicle name
                        _phoneNumberController.text, // Phone number
                        _vehicleType, // Vehicle type
                        _registrationNumber, // Registration number
                        _role, // Role
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }

  void _showStudentRegistrationDialog(BuildContext context) { // Method to show student registration dialog
    showDialog( // Show dialog
      context: context, // Build context
      builder: (BuildContext context) { // Builder for dialog
        return AlertDialog( // AlertDialog widget for student registration
          title: const Text('Enter Student id'), // Dialog title
          content: CustomTextField( // Custom text field for student ID input
            controller: _studentidController, // Student ID controller
            hintText: 'Your registration number', // Hint text for input field
          ),
          actions: [ // List of actions
            CustomMediumButton( // Custom medium button for OK
              title: 'OK', // Button title
              ontap: () { // Define action on button tap
                _registrationNumber = _studentidController.text; // Update registration number
                Navigator.of(context).pop(); // Close dialog
              },
            ),
          ],
        );
      },
    );
  }

  void _showTeacherRegistrationDialog(BuildContext context) { // Method to show teacher registration dialog
    showDialog( // Show dialog
      context: context, // Build context
      builder: (BuildContext context) { // Builder for dialog
        return AlertDialog( // AlertDialog widget for teacher registration
          title: const Text('Enter Employee Id'), // Dialog title
          content: CustomTextField( // Custom text field for employee ID input
            controller: _employeeidController, // Employee ID controller
            hintText: 'Your registration number', // Hint text for input field
          ),
          actions: [ // List of actions
            CustomMediumButton( // Custom medium button for OK
              title: 'OK', // Button title
              ontap: () { // Define action on button tap
                _registrationNumber = _employeeidController.text; // Update registration number
                Navigator.of(context).pop(); // Close dialog
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildTextField( // Method to build custom text field
    BuildContext context, // Build context
    TextEditingController controller, // Text field controller
    String label, { // Label for the text field
    bool isPassword = false, // Boolean to indicate if it's a password field
  }) {
    return Padding( // Padding widget for spacing
      padding: EdgeInsets.only(bottom: 10.h), // Padding for bottom spacing
      child: CustomTextField( // CustomTextField widget for input field
        controller: controller, // Text field controller
        hintText: label, // Hint text for input field
      ),
    );
  }
}
