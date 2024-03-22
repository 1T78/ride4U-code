import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ride_4_you/global_custom_widgets/custom_sized_box.dart';
import 'package:ride_4_you/global_custom_widgets/custom_text_form_field.dart';

class AcceptRejectRide extends StatefulWidget {
  const AcceptRejectRide({super.key}); // Constructor for AcceptRejectRide widget
  static const tag = "AcceptRejectRide"; // Static constant for route name

  @override
  State<AcceptRejectRide> createState() => _AcceptRejectRideState(); // Create state for AcceptRejectRide
}

class _AcceptRejectRideState extends State<AcceptRejectRide> {
  TextEditingController destinationController = TextEditingController(); // Controller for destination text field
  TextEditingController pickupController = TextEditingController(); // Controller for pickup text field

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold widget for the screen layout
      resizeToAvoidBottomInset: false, // Disable resizing to avoid bottom inset
      body: SafeArea( // SafeArea widget to avoid overlapping with system UI
        child: Padding( // Padding widget for adding padding around the content
          padding: EdgeInsets.only( // Set padding
              left: 30.w,
              right: 30.w,
              top: MediaQuery.of(context).size.height * 0.12), // Set top padding based on screen height
          child: ListView( // ListView widget for arranging children in a scrollable list
            children: <Widget>[ // List of children widgets
              _customListtile( // Custom function to build list tile for user information
                'Muhammad Ali', // User name
                Icons.account_circle_outlined, // Icon for user
              ),
              _customListtile( // Custom function to build list tile for user information
                'Male', // Gender
                Icons.person, // Icon for gender
              ),
              _customListtile( // Custom function to build list tile for user information
                'Student', // User type
                Icons.person_2_outlined, // Icon for user type
              ),
              CustomSize( // CustomSize widget for adding vertical spacing
                height: 10.h,
              ),
              CustomTextField( // CustomTextField widget for entering destination
                controller: destinationController, // Set controller
                hintText: "pickup", // Hint text for pickup
                prefix: const Icon( // Icon prefix for pickup text field
                  Icons.location_on_outlined,
                  color: Colors.green,
                ),
              ),
              CustomSize( // CustomSize widget for adding vertical spacing
                height: 10.h,
              ),
              CustomTextField( // CustomTextField widget for entering destination
                controller: pickupController, // Set controller
                hintText: "Destination", // Hint text for destination
                prefix: const Icon(Icons.departure_board, color: Colors.green), // Icon prefix for destination text field
              ),
              Padding( // Padding widget for adding padding around the row of buttons
                padding: const EdgeInsets.symmetric(vertical: 20.0), // Set vertical padding
                child: Row( // Row widget for arranging buttons horizontally
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align buttons with space between them
                  children: [_buildButton('Accept'), _buildButton('Reject')], // List of buttons
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _customListtile(String title, IconData icon) { // Function to build list tile for user information
    return Padding( // Padding widget for adding padding around the row
      padding: const EdgeInsets.symmetric(vertical: 5.0), // Set vertical padding
      child: Row( // Row widget for arranging user information horizontally
        children: [
          Icon( // Icon widget for user information
            icon, // Icon for user information
            size: 45, // Set icon size
            color: Colors.green, // Set icon color
          ),
          Padding( // Padding widget for adding padding around the text
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
            ),
            child: Text( // Text widget for user information
              title, // User information text
              style: TextStyle( // Text style for user information
                fontSize: 14.sp, // Set font size
                fontWeight: FontWeight.bold, // Set font weight to bold
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String txt) { // Function to build Accept and Reject buttons
    return GestureDetector( // GestureDetector widget for handling tap events
      onTap: () { // Callback function for tap event
        Fluttertoast.showToast(msg: txt); // Show toast message with button text
      },
      child: Container( // Container widget for button
          width: MediaQuery.of(context).size.width / 2.5, // Set button width
          height: MediaQuery.of(context).size.height * 0.05, // Set button height
          decoration: BoxDecoration( // Decoration for button
              borderRadius: BorderRadius.circular(15), // Set border radius
              color: Colors.green), // Set button color
          child: Center( // Center widget for aligning text in the button
            child: Text( // Text widget for button text
              txt, // Button text
              style: const TextStyle(color: Colors.white), // Set text color to white
            ),
          )),
    );
  }
}
