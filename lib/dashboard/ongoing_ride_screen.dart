// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart'; // Import the Flutter Material package
import 'package:flutter_rating_bar/flutter_rating_bar.dart'; // Import the Flutter Rating Bar package
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import the Flutter Screen Util package
import 'package:ride_4_you/global_custom_widgets/custom_medium_button.dart'; // Import custom medium button widget
import 'package:ride_4_you/global_custom_widgets/custom_sized_box.dart'; // Import custom sized box widget
import 'package:ride_4_you/global_custom_widgets/custom_text_form_field.dart'; // Import custom text form field widget

class OnGoingRide extends StatelessWidget { // Define a widget for the ongoing ride screen
  OnGoingRide({super.key}); // Constructor for the OnGoingRide widget
  static const tag = "OnGoingRide"; // Tag for identifying the screen
  
  TextEditingController pickupLocationController = TextEditingController(); // Controller for pickup location text field

  @override
  Widget build(BuildContext context) { // Build method to create the OnGoingRide widget
    return Scaffold( // Scaffold widget for the screen
      body: Padding( // Padding widget for the main content
        padding: const EdgeInsets.all(12.0), // Padding for all sides
        child: Column( // Column widget for arranging content vertically
          crossAxisAlignment: CrossAxisAlignment.start, // Align content to start (left)
          children: [ // List of children widgets
            Text( // Text widget for displaying the title
              "On Going Journey ", // Title text
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp), // Text style
            ),
            CustomSize( // CustomSize widget for adding vertical space
              height: MediaQuery.of(context).size.height * 0.01.h, // Height of the custom size widget
            ),
            Container( // Container widget for wrapping the journey details
              decoration: BoxDecoration( // Decoration for the container
                  borderRadius: BorderRadius.circular(10.r), // Border radius
                  color: Colors.green.shade100), // Background color
              child: Padding( // Padding widget for the container content
                padding: const EdgeInsets.all(8.0), // Padding for all sides
                child: Column( // Column widget for arranging content vertically
                  crossAxisAlignment: CrossAxisAlignment.start, // Align content to start (left)
                  children: [ // List of children widgets
                    Text( // Text widget for displaying booked seat
                      "Booked Seat :", // Title text
                      style: TextStyle( // Text style
                          fontWeight: FontWeight.w600, fontSize: 20.sp), // Font weight and size
                    ),
                    Row( // Row widget for arranging content horizontally
                      children: [ // List of children widgets
                        const Text( // Text widget for displaying passenger name
                          "Passenger 1", // Passenger name text
                          style: TextStyle(fontWeight: FontWeight.w400), // Font weight
                        ),
                        CustomSize( // CustomSize widget for adding horizontal space
                          width: 10.w, // Width of the custom size widget
                        ),
                        Container( // Container widget for adding an icon button
                            decoration: BoxDecoration( // Decoration for the container
                                border: Border.all(color: Colors.green), // Border color
                                borderRadius: BorderRadius.circular(60.r)), // Border radius
                            child: Padding( // Padding widget for the container content
                              padding: const EdgeInsets.all(4.0), // Padding for all sides
                              child: Icon( // Icon widget for displaying an icon
                                Icons.add, // Add icon
                                color: Colors.green, // Icon color
                                size: 12.sp, // Icon size
                              ),
                            )),
                      ],
                    ),
                    CustomSize( // CustomSize widget for adding vertical space
                      height: 20.h, // Height of the custom size widget
                    ),
                    Row( // Row widget for arranging content horizontally
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align content to space between
                      children: [ // List of children widgets
                        CircleAvatar( // CircleAvatar widget for displaying a user avatar
                          backgroundColor: Colors.green.shade100, // Background color of the avatar
                          child: const Icon(Icons.person), // Icon for the avatar
                        ),
                        GestureDetector( // GestureDetector widget for adding a gesture recognizer
                            onTap: () { // Callback function when tapped
                              _showStudentRegistrationDialog(context); // Show student registration dialog
                            },
                            child: const Icon(Icons.call)), // Icon button for calling
                        CircleAvatar( // CircleAvatar widget for displaying a user avatar
                          backgroundColor: Colors.green.shade100, // Background color of the avatar
                          child: const Icon(Icons.message_outlined), // Icon for the avatar
                        ),
                      ],
                    ),
                    _buildSummaryItem("Ali "), // Custom method for building a summary item
                    _buildSummaryItem("PickUp location"), // Custom method for building a summary item
                    CustomTextField( // CustomTextField widget for entering pickup location
                        controller: pickupLocationController, // Controller for the text field
                        hintText: "Saddar"), // Hint text for the text field
                    CustomSize( // CustomSize widget for adding vertical space
                      height: MediaQuery.of(context).size.height * 0.01.h, // Height of the custom size widget
                    ),
                    _buildSummaryItem("Fare 200 Rs "), // Custom method for building a summary item
                  ],
                ),
              ),
            ),
            CustomSize( // CustomSize widget for adding vertical space
              height: MediaQuery.of(context).size.height * 0.02.h, // Height of the custom size widget
            ),
            Container( // Container widget for displaying passenger details
              decoration: BoxDecoration( // Decoration for the container
                  borderRadius: BorderRadius.circular(20.r), // Border radius
                  color: Colors.green.shade100), // Background color
              width: double.infinity, // Set width to match parent
              child: Padding( // Padding widget for the container content
                padding: const EdgeInsets.all(10.0), // Padding for all sides
                child: Row( // Row widget for arranging content horizontally
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align content to space between
                  children: [ // List of children widgets
                    const Text( // Text widget for displaying passenger name
                      "Passenger 1", // Passenger name text
                      style: TextStyle(fontWeight: FontWeight.w800), // Font weight
                    ),
                    CustomSize( // CustomSize widget for adding horizontal space
                      width: 10.w, // Width of the custom size widget
                    ),
                    Icon( // Icon widget for adding an icon
                      Icons.add, // Add icon
                      color: Colors.black, // Icon color
                      size: 14.sp, // Icon size
                    ),
                  ],
                ),
              ),
            ),
            CustomSize( // CustomSize widget for adding vertical space
              height: MediaQuery.of(context).size.height * 0.02.h, // Height of the custom size widget
            ),
            Row( // Row widget for arranging content horizontally
              mainAxisAlignment: MainAxisAlignment.spaceAround, // Align content to space around
              children: [ // List of children widgets
                CustomMediumButton( // CustomMediumButton widget for cancel button
                    title: "Cancel", // Button title
                    ontap: () { // Callback function when tapped
                      Navigator.of(context).pop(); // Close the current screen
                    }),
                CustomMediumButton( // CustomMediumButton widget for finish ride button
                    title: "Finish Ride", // Button title
                    ontap: () { // Callback function when tapped
                      _showTeacherRegistrationDialog(context); // Show teacher registration dialog
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryItem(String text) { // Custom method for building a summary item
    return Column( // Column widget for arranging content vertically
      crossAxisAlignment: CrossAxisAlignment.start, // Align content to start (left)
      children: [ // List of children widgets
        Text( // Text widget for displaying summary text
          text, // Summary text
          style: const TextStyle(fontWeight: FontWeight.w600), // Text style
        ),
        CustomSize(height: 22.h), // CustomSize widget for adding vertical space
      ],
    );
  }

  void _showStudentRegistrationDialog(BuildContext context) { // Method for showing student registration dialog
    showDialog( // Show dialog method
      context: context, // Context
      builder: (BuildContext context) { // Builder function for dialog
        return AlertDialog( // AlertDialog widget for displaying the dialog
          title: const Text('03030987654'), // Dialog title
          actions: [ // List of actions/widgets in the dialog
            CustomMediumButton( // CustomMediumButton widget for OK button
              title: 'OK', // Button title
              ontap: () { // Callback function when tapped
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  void _showTeacherRegistrationDialog(BuildContext context) { // Method for showing teacher registration dialog
    double initialRating = 1.0; // Initial rating value

    showDialog( // Show dialog method
      context: context, // Context
      builder: (BuildContext context) { // Builder function for dialog
        return AlertDialog( // AlertDialog widget for displaying the dialog
          backgroundColor: Colors.white, // Background color of the dialog
          title: Column( // Column widget for arranging content vertically
            children: [ // List of children widgets
              Text( // Text widget for displaying the dialog title
                'Your ride is Ended', // Dialog title text
                style: TextStyle(color: Colors.green, fontSize: 22.sp), // Text style
              ),
              Text( // Text widget for displaying a message
                "How was Your Experience", // Message text
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp), // Text style
              ),
              Text( // Text widget for displaying a message
                "Rate Your Driver", // Message text
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp), // Text style
              ),
              // Adding the RatingBar widget
              RatingBar.builder( // RatingBar widget for rating
                initialRating: initialRating, // Initial rating value
                minRating: 1, // Minimum rating value
                direction: Axis.horizontal, // Rating bar direction
                allowHalfRating: true, // Allow half ratings
                itemCount: 5, // Total number of rating items
                itemPadding: EdgeInsets.symmetric(horizontal: 0.2.w), // Item padding
                itemBuilder: (context, _) => const Icon( // Item builder function for rating items
                  Icons.star, // Star icon
                  color: Colors.amber, // Star color
                ),
                onRatingUpdate: (rating) { // Callback function when rating is updated
                  // print(rating);
                },
              ),
            ],
          ),
          actions: [ // List of actions/widgets in the dialog
            Align( // Align widget for aligning content
              alignment: Alignment.center, // Align content to center
              // Assuming CustomMediumButton is a custom styled FlatButton or ElevatedButton
              child: CustomMediumButton( // CustomMediumButton widget for OK button
                title: 'OK', // Button title
                ontap: () { // Callback function when tapped
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
