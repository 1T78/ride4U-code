// Importing necessary packages
import 'package:flutter/material.dart'; // Flutter Material package for UI components
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Flutter Screen Util package for responsive design
import 'package:ride_4_you/global_custom_widgets/custom_large_button.dart'; // Importing CustomLargeButton widget
import 'package:ride_4_you/global_custom_widgets/custom_sized_box.dart'; // Importing CustomSize widget

// Defining EndRide as a StatelessWidget
class EndRide extends StatelessWidget {
  const EndRide({super.key}); // Constructor for EndRide widget
  static const tag = "EndRide"; // Static constant for the route tag

  @override
  Widget build(BuildContext context) {
    // Building the UI for EndRide widget
    return Scaffold(
      appBar: AppBar(
        // App bar with leading back button and actions
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Back button icon
          onPressed: () {
            Navigator.of(context).pop(); // Popping the current route
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward), // Forward button icon
            onPressed: () {
              // Handle forward button press
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0), // Setting padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Ride Summary", // Ride summary title
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp), // Text style
            ),
            CustomSize(
              height: MediaQuery.of(context).size.height * 0.01.h, // Custom sized box for spacing
            ),
            _buildSummaryItem("Passenger 1 :"), // Building summary item for passenger 1
            _buildSummaryItem("Ali :"), // Building summary item for passenger name
            _buildSummaryItem("Fare 100 Rs :"), // Building summary item for fare
            CustomLargeButton(title: "Complete", onTap: () {}), // Button for completing the ride
            CustomSize(
              height: MediaQuery.of(context).size.height * 0.04.h, // Custom sized box for spacing
            ),
            _buildSummaryItem("Passenger 2 :"), // Building summary item for passenger 2
            _buildSummaryItem("Noor :"), // Building summary item for passenger name
            _buildSummaryItem("Fare 200 Rs :"), // Building summary item for fare
            CustomLargeButton(title: "Complete", onTap: () {}), // Button for completing the ride
            const Spacer(), // Spacer widget to fill remaining space
            CustomLargeButton(
                title: "Finish", // Finish button title
                onTap: () {
                  _showTeacherRegistrationDialog(context); // Showing registration dialog
                }),
          ],
        ),
      ),
    );
  }

  // Function to build a summary item widget
  Widget _buildSummaryItem(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text, // Text for the summary item
          style: const TextStyle(fontWeight: FontWeight.w400), // Text style
        ),
        CustomSize(height: 20.h), // Custom sized box for spacing
      ],
    );
  }

  // Function to show registration dialog
  void _showTeacherRegistrationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white, // Setting background color
          title: Column(
            children: [
              Text(
                'Hurray!!!', // Dialog title
                style: TextStyle(color: Colors.green, fontSize: 22.sp), // Text style
              ),
              Text(
                "The ride is Completed!", // Dialog message
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp), // Text style
              ),
            ],
          ),
          actions: [
            Align(
                alignment: Alignment.center,
                child: Icon(
                  Icons.emoji_emotions, // Emoticon icon
                  color: Colors.orange.shade700, // Icon color
                  size: MediaQuery.of(context).size.height * 0.1.sp, // Icon size
                )),
          ],
        );
      },
    );
  }
}
