import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ride_4_you/dashboard/ride_request_details.dart'; // Import RideRequestDetails screen
import 'package:ride_4_you/global_custom_widgets/custom_sized_box.dart'; // Import CustomSize widget

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key}); // Constructor for NotificationScreen widget

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(20.r)),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'You have new request waiting', // Notification message
                            style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12.sp), // Style for notification message
                          ),
                          GestureDetector(
                            onTap: (){
                              //onTapViewDetails( context); // Handle tap on "View Details" text
                            },
                            child: Text(
                              'View Details', // Text to view request details
                              style: TextStyle(color: Colors.green,fontWeight: FontWeight.w600,fontSize: 12.sp), // Style for "View Details" text
                            ),
                          ),
                        ],
                      ),
                      const Column(
                        children: [
                          Text('2:44 pm'), // Time of notification
                          Text('Today'), // Date of notification
                        ],
                      ),
                    ],
                  ),
                ),
              )),
          CustomSize(height:10.h), // CustomSize widget for spacing
          Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(20.r)),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your have new request waiting', // Notification message
                            style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12.sp), // Style for notification message
                          ),
                          Text(
                            'View Details', // Text to view request details
                            style: TextStyle(color: Colors.green,fontWeight: FontWeight.w600,fontSize: 12.sp), // Style for "View Details" text
                          ),
                        ],
                      ),
                      const Column(
                        children: [
                          Text('2:44 pm'), // Time of notification
                          Text('Today'), // Date of notification
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
  onTapViewDetails(BuildContext context) { // Function to navigate to RideRequestDetails screen
    Navigator.pushNamed(context, RideRequestDetails.tag);
  }
}
