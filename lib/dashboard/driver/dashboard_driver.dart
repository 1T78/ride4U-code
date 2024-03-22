import 'package:flutter/material.dart';
import 'package:ride_4_you/dashboard/driver/accept_reject_ride.dart';
import 'package:ride_4_you/dashboard/driver/driver_homeScreen.dart';
import 'package:ride_4_you/dashboard/driver/notification_screen.dart';
import 'package:ride_4_you/dashboard/inbox_screen.dart';
import 'package:ride_4_you/dashboard/profile/profile_setting_screen.dart';

class DriverDashboardScreen extends StatefulWidget {
  const DriverDashboardScreen({Key? key}) : super(key: key); // Constructor for DriverDashboardScreen widget

  @override
  // ignore: library_private_types_in_public_api
  _DriverDashboardScreenState createState() => _DriverDashboardScreenState(); // Create state for DriverDashboardScreen
}

class _DriverDashboardScreenState extends State<DriverDashboardScreen> {
  int _currentIndex = 0; // Variable to keep track of current index for navigation

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold widget for the screen layout
      appBar: AppBar( // AppBar widget for the top app bar
        leading: IconButton( // IconButton for the leading back button
          icon: const Icon(Icons.arrow_back), // Back button icon
          onPressed: () { // Callback function for back button tap
            _updateIndex(_currentIndex - 1); // Call function to update index with previous value
          },
        ),
        actions: [ // List of actions in the app bar
          IconButton( // IconButton for the forward button
            icon: const Icon(Icons.arrow_forward), // Forward button icon
            onPressed: () { // Callback function for forward button tap
              _updateIndex(_currentIndex + 1); // Call function to update index with next value
            },
          ),
        ],
      ),
      body: GestureDetector( // GestureDetector widget to handle tap events
        behavior: HitTestBehavior.opaque, // Set hit test behavior to opaque
        onTapDown: (TapDownDetails details) { // Callback function for tap down event
          // Determine if tap is on the left or right side of the screen
          final screenWidth = MediaQuery.of(context).size.width; // Get screen width
          if (details.localPosition.dx < screenWidth / 2) { // If tap is on the left side
            _updateIndex(_currentIndex - 1); // Call function to update index with previous value
          } else { // If tap is on the right side
            _updateIndex(_currentIndex + 1); // Call function to update index with next value
          }
        },
        child: IndexedStack( // IndexedStack widget to manage multiple child widgets with same size
          index: _currentIndex, // Set index to show the current child widget
          children: [ // List of child widgets managed by IndexedStack
            DriverHomeScreen(), // Placeholder for home screen widget
            const AcceptRejectRide(), // AcceptRejectRide widget
            const NotificationScreen(), // NotificationScreen widget
            InboxScreen(), // Placeholder for alerts screen widget
            const ProfileSettingScreen(), // Placeholder for profile screen widget
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar( // BottomNavigationBar widget for bottom navigation
        currentIndex: _currentIndex, // Set current index for navigation
        onTap: (int index) { // Callback function for navigation tap
          _updateIndex(index); // Call function to update index with tapped value
        },
        items: const [ // List of BottomNavigationBarItems
          BottomNavigationBarItem( // BottomNavigationBarItem for home screen
            icon: Icon(Icons.home), // Home screen icon
            label: '', // Empty label
          ),
          BottomNavigationBarItem( // BottomNavigationBarItem for ride screen
            icon: Icon(Icons.directions_car), // Ride screen icon
            label: '', // Empty label
          ),
          BottomNavigationBarItem( // BottomNavigationBarItem for notifications screen
            icon: Icon(Icons.notifications), // Notifications screen icon
            label: '', // Empty label
          ),
          BottomNavigationBarItem( // BottomNavigationBarItem for inbox screen
            icon: Icon(Icons.message), // Inbox screen icon
            label: '', // Empty label
          ),
          BottomNavigationBarItem( // BottomNavigationBarItem for profile screen
            icon: Icon(Icons.person), // Profile screen icon
            label: '', // Empty label
          ),
        ],
        type: BottomNavigationBarType.fixed, // Set bottom navigation bar type to fixed
        selectedItemColor: Colors.green, // Set selected item color
        unselectedItemColor: Colors.grey, // Set unselected item color
        backgroundColor: Colors.white, // Set background color
      ),
    );
  }

  void _updateIndex(int newIndex) { // Function to update current index
    setState(() { // Set state to update widget
      if (newIndex >= 0 && newIndex < 5) { // Check if new index is valid
        _currentIndex = newIndex; // Update current index
      }
    });
  }
}
