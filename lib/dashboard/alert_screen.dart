import 'package:flutter/material.dart'; // Import the Flutter Material package
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import the flutter_screenutil package for responsive UI
import 'package:ride_4_you/dashboard/ride_request_details.dart'; // Import the RideRequestDetails widget

import '../global_custom_widgets/custom_sized_box.dart'; // Import the CustomSizedBox widget

class AlertsScreen extends StatelessWidget { // Define a widget for the AlertsScreen
  const AlertsScreen({super.key}); // Constructor for the AlertsScreen widget

  @override
  Widget build(BuildContext context) { // Build method to create the AlertsScreen widget
    return Padding( // Padding widget to add padding around the content
      padding: const EdgeInsets.all(8.0), // Padding for all sides
      child: Column( // Column widget to arrange content vertically
        children: [ // List of children widgets
          Container( // Container widget for the first alert
              width: double.infinity, // Set width to match parent width
              decoration: BoxDecoration( // Decoration for the container
                  color: Colors.green.shade100, // Set background color
                  borderRadius: BorderRadius.circular(20.r)), // Apply border radius
              child: Center( // Center widget to center content horizontally and vertically
                child: Padding( // Padding widget to add padding around the content
                  padding: const EdgeInsets.all(8.0), // Padding for all sides
                  child: Row( // Row widget to arrange content horizontally
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align content with space between them
                    children: [ // List of children widgets
                      Column( // Column widget to arrange content vertically
                        crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start of the column
                        children: [ // List of children widgets
                          Text( // Text widget for alert message
                            'Your ride request has been accepted', // Alert message text
                            style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12.sp), // Text style
                          ),
                          GestureDetector( // GestureDetector widget for tapping to view details
                            onTap: (){ // Define onTap action
                              onTapViewDetails( context); // Call onTapViewDetails method
                            },
                            child: Text( // Text widget for 'View Details' link
                              'View Details', // Text for 'View Details' link
                              style: TextStyle(color: Colors.green,fontWeight: FontWeight.w600,fontSize: 12.sp), // Text style
                            ),
                          ),
                        ],
                      ),
                      const Column( // Column widget for time details
                        children: [ // List of children widgets
                          Text('2:44 pm'), // Text widget for time
                          Text('Today'), // Text widget for date
                        ],
                      ),
                    ],
                  ),
                ),
              )),
          CustomSize(height:10.h), // CustomSizedBox widget for adding vertical space
          Container( // Container widget for the second alert
              width: double.infinity, // Set width to match parent width
              decoration: BoxDecoration( // Decoration for the container
                  color: Colors.green.shade100, // Set background color
                  borderRadius: BorderRadius.circular(20.r)), // Apply border radius
              child: Center( // Center widget to center content horizontally and vertically
                child: Padding( // Padding widget to add padding around the content
                  padding: const EdgeInsets.all(8.0), // Padding for all sides
                  child: Row( // Row widget to arrange content horizontally
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align content with space between them
                    children: [ // List of children widgets
                      Column( // Column widget to arrange content vertically
                        crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start of the column
                        children: [ // List of children widgets
                          Text( // Text widget for alert message
                            'Your ride request has been Rejected', // Alert message text
                            style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12.sp), // Text style
                          ),
                          // Text( // Text widget for 'View Details' link (commented out)
                          //   'View Details', // Text for 'View Details' link (commented out)
                          //   style: TextStyle(color: Colors.green,fontWeight: FontWeight.w600,fontSize: 12.sp), // Text style (commented out)
                          // ),
                        ],
                      ),
                      const Column( // Column widget for time details
                        children: [ // List of children widgets
                          Text('2:44 pm'), // Text widget for time
                          Text('Today'), // Text widget for date
                        ],
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }

  onTapViewDetails(BuildContext context) { // Method to navigate to ride request details screen
    Navigator.pushNamed(context, RideRequestDetails.tag); // Navigate to RideRequestDetails screen
  }
}
