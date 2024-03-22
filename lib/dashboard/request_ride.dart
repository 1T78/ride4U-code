import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ride_4_you/global_custom_widgets/custom_app_bar.dart';
import 'package:ride_4_you/global_custom_widgets/custom_medium_button.dart';
import 'package:ride_4_you/global_custom_widgets/custom_sized_box.dart';

class RideRequest extends StatelessWidget {
  const RideRequest({super.key}); // Constructor for RideRequest widget
  static const tag = "RideRequest"; // Static tag for identifying the screen

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold widget for the screen layout
      appBar: const CustomAppBarWidget( // Custom app bar with back button
        showBackButton: true,
      ),
      body: Padding( // Padding widget for adding padding around the content
        padding: EdgeInsets.all(20.h), // Set padding using ScreenUtil for responsive design
        child: Column( // Column widget for arranging children vertically
          crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start (left) of the column
          children:[
            const Text( // Title text for the ride request
              'Do you want to book this ride?',
              style: TextStyle(
                fontSize: 21, // Set font size using absolute value
                fontWeight: FontWeight.bold, // Set font weight to bold
              ),
            ),
            const SizedBox(height: 20), // SizedBox for adding vertical spacing
            Text( // Text widget for displaying pickup time and location
              '8:10 am : G15',
              style: TextStyle(
                fontSize: 18.sp, // Set font size using ScreenUtil for responsive design
                fontWeight: FontWeight.bold, // Set font weight to bold
              ),
            ),
            Text( // Text widget for displaying drop-off time and location
              '9:00 am : CUST',
              style: TextStyle(
                fontSize: 18.sp, // Set font size using ScreenUtil for responsive design
                fontWeight: FontWeight.bold, // Set font weight to bold
              ),
            ),
            const SizedBox(height: 20), // SizedBox for adding vertical spacing
            Container( // Container widget for styling the passenger information
              decoration: BoxDecoration( // BoxDecoration for adding border and border radius
                border: Border.all(color: Colors.green), // Set border color
                borderRadius: BorderRadius.circular(10), // Set border radius
              ),
              child: ListTile( // ListTile widget for displaying passenger details
                leading: const Icon(Icons.account_circle, size: 50), // Leading icon
                title: Text( // Passenger name
                  'Noor',
                  style: TextStyle(
                    fontSize: 12.sp, // Set font size using ScreenUtil for responsive design
                    fontWeight: FontWeight.bold, // Set font weight to bold
                  ),
                ),
                subtitle: Text( // Passenger details
                  'Female\nStudent',
                  style: TextStyle(
                    fontSize: 12.sp, // Set font size using ScreenUtil for responsive design
                    fontWeight: FontWeight.bold, // Set font weight to bold
                  ),
                ),
                trailing: const Text( // Passenger rating
                  '4.9 ★',
                  style: TextStyle(color: Colors.green, fontSize: 18), // Set color and font size
                ),
              ),
            ),
            CustomSize( // CustomSize widget for adding vertical spacing based on screen height
              height: MediaQuery.of(context).size.height * 0.03.h, // Set height using MediaQuery for responsive design
            ),
            Row( // Row widget for arranging widgets horizontally
              children: [
                Icon( // Icon widget for displaying vehicle type
                  Icons.drive_eta_outlined,
                  color: Colors.green, // Set icon color
                  size: 40.sp, // Set icon size using ScreenUtil for responsive design
                ),
                const CustomSize( // CustomSize widget for adding horizontal spacing
                  width: 20, // Set width using absolute value
                ),
                Text('Alto', // Text widget for displaying vehicle type
                  style: TextStyle(
                    fontSize: 14.sp, // Set font size using ScreenUtil for responsive design
                    fontWeight: FontWeight.bold, // Set font weight to bold
                  ),
                ),
              ],
            ),
            CustomSize( // CustomSize widget for adding vertical spacing based on screen height
              height: MediaQuery.of(context).size.height * 0.03.h, // Set height using MediaQuery for responsive design
            ),
            Row( // Row widget for arranging widgets horizontally
               children: [
                Text('Fare', // Text widget for displaying fare label
              style: TextStyle(
                fontSize: 20.sp, // Set font size using ScreenUtil for responsive design
                fontWeight: FontWeight.bold, // Set font weight to bold
                color: Colors.green // Set text color
              ),
            ),
                 const CustomSize( // CustomSize widget for adding horizontal spacing
                   width: 20, // Set width using absolute value
                 ),
                const Text('150 Rs', // Text widget for displaying fare amount
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)), // Set font size and weight
              ],
            ),
            Row( // Row widget for arranging widgets horizontally
               children: [
                Text('Capacity in car', // Text widget for displaying car capacity label
                  style: TextStyle(
                      fontSize: 20.sp, // Set font size using ScreenUtil for responsive design
                      fontWeight: FontWeight.bold, // Set font weight to bold
                      color: Colors.green // Set text color
                  ),
                ),
                 const CustomSize( // CustomSize widget for adding horizontal spacing
                   width: 20, // Set width using absolute value
                 ),
                const Text('04', // Text widget for displaying car capacity
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), // Set font size and weight
              ],
            ),
            Row( // Row widget for arranging widgets horizontally
              children: [
                Text('Book Rides', // Text widget for displaying booked rides label
                  style: TextStyle(
                      fontSize: 20.sp, // Set font size using ScreenUtil for responsive design
                      fontWeight: FontWeight.bold, // Set font weight to bold
                      color: Colors.green // Set text color
                  ),
                ),
                const CustomSize( // CustomSize widget for adding horizontal spacing
                  width: 20, // Set width using absolute value
                ),
                const Text('01', // Text widget for displaying booked rides count
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), // Set font size and weight
              ],
            ),
            SizedBox(height: 20.h), // SizedBox for adding vertical spacing based on screen height
            Row( // Row widget for arranging widgets horizontally
              mainAxisAlignment: MainAxisAlignment.spaceAround, // Align widgets with equal spacing around
              children: [
              CustomMediumButton(title: "Go-back", ontap: (){ // CustomMediumButton widget for 'Go-back' button
                Navigator.of(context).pop(); // Pop the current screen from the navigation stack
              }),
              CustomMediumButton(title: "Request", ontap: (){ // CustomMediumButton widget for 'Request' button
                _showStudentRegistrationDialog(context); // Call function to show registration dialog
              }),
            ],)
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
          backgroundColor: Colors.green.shade100, // Set background color
          title: const Text('Your request has been sent'), // Dialog title
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
