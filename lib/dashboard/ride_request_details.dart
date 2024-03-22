import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ride_4_you/global_custom_widgets/custom_app_bar.dart';
import 'package:ride_4_you/global_custom_widgets/custom_large_button.dart';
import 'package:ride_4_you/global_custom_widgets/custom_sized_box.dart';

import '../global_custom_widgets/custom_medium_button.dart';

class RideRequestDetails extends StatelessWidget {
  const RideRequestDetails({super.key}); // Constructor for RideRequestDetails widget
  static const tag = "RideRequestDetails"; // Static tag for identifying the screen

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold widget for the screen layout
      appBar: const CustomAppBarWidget( // Custom app bar with back button
        showBackButton: true,
      ),
      backgroundColor: Colors.white, // Set background color to white
      body: Padding( // Padding widget for adding padding around the content
        padding: EdgeInsets.all(20.h), // Set padding using ScreenUtil for responsive design
        child: Column( // Column widget for arranging children vertically
          crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start (left) of the column
          children: <Widget>[
            Text( // Text widget for displaying ride arrival message
              'Your ride is arriving',
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold), // Set font size and weight
            ),
            CustomSize( // CustomSize widget for adding vertical spacing
              height: 20.h, // Set height using ScreenUtil for responsive design
            ),
            Row( // Row widget for arranging widgets horizontally
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align widgets with equal spacing between them
              children: [
                CircleAvatar( // CircleAvatar widget for displaying passenger avatar
                  backgroundColor: Colors.green.shade100, // Set background color
                  child:
                      const Icon(Icons.person), // Replace with your actual asset path
                ),
                GestureDetector( // GestureDetector widget for handling tap on call button
                    onTap:() {
                      _showStudentRegistrationDialog(context); // Call function to show registration dialog
                    },child: const Icon(Icons.call)), // Call button icon
                CircleAvatar( // CircleAvatar widget for displaying message icon
                  backgroundColor: Colors.green.shade100, // Set background color
                  child: const Icon(Icons
                      .message_outlined), // Replace with your actual asset path
                ),
              ],
            ),
            SizedBox(height: 20.h), // SizedBox for adding vertical spacing
            ListTile( // ListTile widget for displaying passenger name
              leading: Text( // Leading text for label
                'Name :',
                style: TextStyle(fontSize: 18.sp), // Set font size using ScreenUtil for responsive design
              ),
              title: const Text('Ali'), // Passenger name
            ),
            const ListTile( // ListTile widget for displaying fare
              leading: Icon(Icons.monetization_on), // Leading icon for fare
              title: Text('Fare: 100 Rs'), // Fare amount
            ),
            const ListTile( // ListTile widget for displaying car details
              leading: Icon(Icons.directions_car), // Leading icon for car
              title: Text('Car'), // Car details
            ),
            const ListTile( // ListTile widget for displaying ride status
              leading: Icon(Icons.receipt_long), // Leading icon for ride status
              title: Text('Ride Status'), // Ride status label
              subtitle: Text('Booked Rides: 02'), // Ride status details
            ),
            SizedBox(height: 20.h), // SizedBox for adding vertical spacing
            const Row( // Row widget for arranging widgets horizontally
              mainAxisAlignment: MainAxisAlignment.spaceAround, // Align widgets with equal spacing around
              children: [
                Text( // Text widget for 'See on Maps' label
                  'See on Maps',
                  style: TextStyle(color: Colors.green), // Set text color to green
                ),
                Icon(Icons.location_on_outlined) // Location icon
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1.h), // SizedBox for adding vertical spacing based on screen height
            CustomLargeButton(title: "Cancel", onTap: () {}) // CustomLargeButton widget for 'Cancel' button
          ],
        ),
      ),
    );
  }
  void _showStudentRegistrationDialog(BuildContext context) { // Function to show registration dialog
    showDialog( // Show dialog function
      context: context, // Current context
      builder: (BuildContext context) { // Builder function to build the dialog
        return AlertDialog( // AlertDialog widget for displaying the dialog
          title: const Text('03030987654'), // Dialog title
           actions: [ // List of actions/widgets in the dialog
            CustomMediumButton( // CustomMediumButton widget for 'OK' button
              title: 'OK', // Button title
              ontap: () { // Button tap callback
                 Navigator.of(context).pop(); // Pop the dialog from the navigation stack
              },
            ),
          ],
        );
      },
    );
  }

}
