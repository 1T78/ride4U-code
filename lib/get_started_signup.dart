// Importing necessary packages
import 'package:flutter/material.dart'; // Flutter Material package for UI components
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Flutter Screen Util package for responsive design
import 'package:ride_4_you/authentication/signup/signup_passenger.dart'; // Importing SignUpPassenger widget
import 'global_custom_widgets/custom_large_button.dart'; // Importing CustomLargeButton widget
import 'global_custom_widgets/custom_sized_box.dart'; // Importing CustomSize widget
import 'authentication/signup/signup_driver.dart'; // Importing SignUpDriver widget

// Defining GetStartSignUp as a StatelessWidget
class GetStartSignUp extends StatelessWidget {
  const GetStartSignUp({Key? key}) : super(key: key); // Constructor for GetStartSignUp widget
  static const String tag = "GetStartSignUp"; // Static constant for the route tag

  @override
  Widget build(BuildContext context) {
    // Building the UI for GetStartSignUp widget
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w), // Setting horizontal padding using ScreenUtil
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.close), // Close icon button
                  onPressed: () {
                    Navigator.pop(context); // Popping the current route
                  },
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Sign up as?', // Text widget with the sign-up prompt
                  style: TextStyle(
                    fontSize: 24.sp, // Setting font size using ScreenUtil
                    fontWeight: FontWeight.bold, // Setting font weight to bold
                  ),
                ),
              ),
              CustomSize(height: MediaQuery.of(context).size.height * 0.16.h), // Custom sized box widget
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.06.h), // Setting vertical padding using ScreenUtil
                child: CustomLargeButton(
                    title: 'Driver', // Title for the driver sign-up button
                    onTap: () {
                      onTapSignUpDriver(context); // Handling onTap event for driver sign-up button
                    }),
              ),
              CustomLargeButton(
                title: 'Passenger', // Title for the passenger sign-up button
                onTap: () {
                  onTapSignUpPassenger(context); // Handling onTap event for passenger sign-up button
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to handle onTap event for signing up as a passenger
  onTapSignUpPassenger(BuildContext context) {
    Navigator.pushNamed(context, SignUpPassenger.tag); // Navigating to SignUpPassenger screen
  }

  // Function to handle onTap event for signing up as a driver
  onTapSignUpDriver(BuildContext context) {
    Navigator.pushNamed(context, SignUpDriver.tag); // Navigating to SignUpDriver screen
  }
}
