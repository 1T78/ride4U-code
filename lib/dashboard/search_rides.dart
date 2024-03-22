import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ride_4_you/dashboard/request_ride.dart';
import 'package:ride_4_you/global_custom_widgets/custom_sized_box.dart';

class SearchRidesScreen extends StatelessWidget {
  const SearchRidesScreen({super.key,this.onSearchPressed}); // Constructor with optional parameters
  final VoidCallback? onSearchPressed; // Callback function for search button

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold widget for the screen layout
      appBar: AppBar( // AppBar widget for the top app bar
        title: const Text('Search Rides'), // Set app bar title
        automaticallyImplyLeading: false, // Disable back button
      ),
      body: Padding( // Padding widget for adding padding around the content
        padding: const EdgeInsets.all(16.0), // Set padding
        child: Column( // Column widget for arranging children vertically
          children: [
            Row( // Row widget for arranging widgets horizontally
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Align widgets with equal space between them
              children: [
                _buildLocationChip('G15'), // Call function to build location chip
                const Icon(Icons.arrow_forward), // Arrow forward icon
                _buildLocationChip('CUST'), // Call function to build location chip
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02.h), // SizedBox for adding vertical spacing based on screen height
            Expanded( // Expanded widget to expand the child to fill the remaining space
              child: GestureDetector( // GestureDetector widget for handling tap
                onTap: () { // Callback function for tap event
                  onTapRideRequestDetails(context); // Call function to navigate to ride request details screen
                },
                child: ListView( // ListView widget for displaying a scrollable list of ride options
                  children: [
                    _buildRideOption( // Call function to build ride option widget
                      driver: 'Ali', // Driver name
                      rating: 4.8, // Driver rating
                      car: 'Mehran', // Car model
                      price: '100 Rs', // Ride price
                      time: '8:00 (G15) \n 9:00 (CUST)', // Ride timings
                    ),
                    _buildRideOption( // Call function to build ride option widget
                      driver: 'Noor', // Driver name
                      rating: 4.9, // Driver rating
                      car: 'Alto', // Car model
                      price: '120 Rs', // Ride price
                      time: '8:00 (F10) \n 8:45 (CUST)', // Ride timings
                    ),
                    // Add more ride options here
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationChip(String location) { // Function to build location chip widget
    return Chip( // Chip widget for displaying location
      padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 10.h), // Set padding
      label: Text(location), // Location text
      backgroundColor: Colors.green[100], // Set background color
    );
  }

  Widget _buildRideOption({ // Function to build ride option widget
    required String driver, // Driver name
    required double rating, // Driver rating
    required String car, // Car model
    required String price, // Ride price
    required String time, // Ride timings
  }) {
    return Card( // Card widget for displaying ride option
      color: Colors.green.shade100, // Set background color
      margin: EdgeInsets.symmetric(vertical: 8.0.h), // Set margin
      child: Padding( // Padding widget for adding padding around the content
        padding: const EdgeInsets.all(12.0), // Set padding
        child: Column( // Column widget for arranging children vertically
          crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start (left) of the column
          children: [
            Row( // Row widget for arranging widgets horizontally
              children: [
                CircleAvatar( // CircleAvatar widget for displaying driver avatar
                  backgroundColor: Colors.grey[100], // Set background color
                  child: const Icon(Icons.person), // Placeholder for driver image
                ),
                const SizedBox(width: 8), // SizedBox for adding horizontal spacing
                Column( // Column widget for arranging children vertically
                  crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start (left) of the column
                  children: [
                    Text(driver), // Driver name
                    const Row( // Row widget for arranging widgets horizontally
                      children: [
                        Text('8.4'), // Driver rating
                        Icon( // Icon widget for star rating
                          Icons.star,
                          color: Colors.amber, // Set color to amber
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(), // Spacer widget to push the widgets to the right
                Text(time), // Ride timings
              ],
            ),
            const SizedBox(height: 8), // SizedBox for adding vertical spacing
            Row( // Row widget for arranging widgets horizontally
              children: [
                const Icon(Icons.time_to_leave), // Icon for car
                CustomSize( // CustomSize widget for adding horizontal spacing
                  width: 10.w,
                ),
                Text(car), // Car model
              ],
            ),
            Row( // Row widget for arranging widgets horizontally
              children: [
                const Icon(Icons.money), // Icon for price
                CustomSize( // CustomSize widget for adding horizontal spacing
                  width: 10.w,
                ),
                Text(price), // Ride price
              ],
            )
          ],
        ),
      ),
    );
  }

  onTapRideRequestDetails(BuildContext context) { // Function to navigate to ride request details screen
    Navigator.pushNamed(context, RideRequest.tag); // Navigate to ride request details screen
  }
}
