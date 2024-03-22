import 'package:flutter/material.dart';
import 'package:ride_4_you/global_custom_widgets/custom_app_bar.dart'; // Importing the custom app bar widget
import 'package:ride_4_you/global_custom_widgets/custom_text_form_field.dart'; // Importing the custom text form field widget

class UpdatePassword extends StatefulWidget { // UpdatePassword widget class
  const UpdatePassword({super.key}); // Constructor for UpdatePassword widget

  @override
  State<UpdatePassword> createState() => _UpdatePasswordState(); // Creating the state for the UpdatePassword widget
}

class _UpdatePasswordState extends State<UpdatePassword> { // State class for the UpdatePassword widget
  TextEditingController oldPasswordController = TextEditingController(); // Controller for the old password text field
  TextEditingController newPasswordController = TextEditingController(); // Controller for the new password text field
  TextEditingController confirmPasswordController = TextEditingController(); // Controller for the confirm password text field

  @override
  Widget build(BuildContext context) { // Build method for the UpdatePassword widget
    return Scaffold( // Scaffold widget to provide the app's basic structure
      appBar: const CustomAppBarWidget( // Custom app bar widget with title and back button
        title: "Update Password", // Title of the app bar
        showBackButton: true, // Show back button on the app bar
      ),
      body: Column( // Column widget to arrange the text fields vertically
        children: [
          CustomTextField( // Custom text field for old password
              controller: oldPasswordController, hintText: "hintText"), // Using the custom text field widget with a controller and hintText
          CustomTextField( // Custom text field for new password
              controller: newPasswordController, hintText: "hintText"), // Using the custom text field widget with a controller and hintText
          CustomTextField( // Custom text field for confirm password
              controller: confirmPasswordController, hintText: "hintText") // Using the custom text field widget with a controller and hintText
        ],
      ),
    );
  }
}
