// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart'; // Import the Flutter Material package
import 'package:ride_4_you/dashboard/profile/profile_setting_screen.dart'; // Import the profile setting screen
import 'package:ride_4_you/dashboard/search_rides.dart'; // Import the search rides screen
import 'alert_screen.dart'; // Import the alerts screen
import 'home_screen.dart'; // Import the home screen
import 'inbox_screen.dart'; // Import the inbox screen

class DashboardScreen extends StatefulWidget { // Define a widget for the dashboard screen
  const DashboardScreen({Key? key}) : super(key: key); // Constructor for the DashboardScreen widget
  static const tag = "DashboardScreen"; // Define a static tag for the DashboardScreen

  @override
  _DashboardScreenState createState() => _DashboardScreenState(); // Create a state for the DashboardScreen
}

class _DashboardScreenState extends State<DashboardScreen> { // Define the state for the DashboardScreen
  int _currentIndex = 0; // Initialize the current index for the bottom navigation bar

  @override
  Widget build(BuildContext context) { // Build method to create the DashboardScreen widget
    return Scaffold( // Scaffold widget to provide the basic structure of the screen
      appBar: AppBar( // AppBar widget for the app bar at the top of the screen
        leading: IconButton( // IconButton for the leading icon (back)
          icon: const Icon(Icons.arrow_back), // Icon for the back button
          onPressed: () { // Callback function for the back button
            _updateIndex(_currentIndex - 1); // Update the index when the back button is pressed
          },
        ),
        actions: [ // List of actions on the app bar
          IconButton( // IconButton for the forward icon
            icon: const Icon(Icons.arrow_forward), // Icon for the forward button
            onPressed: () { // Callback function for the forward button
              _updateIndex(_currentIndex + 1); // Update the index when the forward button is pressed
            },
          ),
        ],
      ),
      body: GestureDetector( // GestureDetector to detect taps on the screen
        behavior: HitTestBehavior.opaque, // Behavior for handling taps
        onTapDown: (TapDownDetails details) { // Callback function for tap down events
          final screenWidth = MediaQuery.of(context).size.width; // Get the screen width
          if (details.localPosition.dx < screenWidth / 2) { // Check if tap is on the left side
            _updateIndex(_currentIndex - 1); // Move to the previous tab if tapped on the left side
          } else { // Tap is on the right side
            _updateIndex(_currentIndex + 1); // Move to the next tab if tapped on the right side
          }
        },
        child: IndexedStack( // IndexedStack widget to manage multiple screens with the same index
          index: _currentIndex, // Current index for the IndexedStack
          children: [ // List of children widgets for the IndexedStack
            HomeScreen( // Placeholder for the home screen widget
              onSearchPressed: () { // Callback function for the search button
                _updateIndex(1); // Move to the search rides screen when the search button is pressed
              },
            ),
            const SearchRidesScreen(), // Placeholder for the search rides screen
            const AlertsScreen(), // Placeholder for the alerts screen
            InboxScreen(), // Placeholder for the inbox screen
            const ProfileSettingScreen(), // Placeholder for the profile setting screen
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar( // BottomNavigationBar widget for the bottom navigation bar
        currentIndex: _currentIndex, // Current index for the bottom navigation bar
        onTap: (int index) { // Callback function for tapping on the bottom navigation bar items
          _updateIndex(index); // Update the index when a bottom navigation bar item is tapped
        },
        items: const [ // List of bottom navigation bar items
          BottomNavigationBarItem( // Bottom navigation bar item for the home screen
            icon: Icon(Icons.home), // Icon for the home screen
            label: '', // Empty label
          ),
          BottomNavigationBarItem( // Bottom navigation bar item for the search rides screen
            icon: Icon(Icons.directions_car), // Icon for the search rides screen
            label: '', // Empty label
          ),
          BottomNavigationBarItem( // Bottom navigation bar item for the alerts screen
            icon: Icon(Icons.notifications), // Icon for the alerts screen
            label: '', // Empty label
          ),
          BottomNavigationBarItem( // Bottom navigation bar item for the inbox screen
            icon: Icon(Icons.message), // Icon for the inbox screen
            label: '', // Empty label
          ),
          BottomNavigationBarItem( // Bottom navigation bar item for the profile setting screen
            icon: Icon(Icons.person), // Icon for the profile setting screen
            label: '', // Empty label
          ),
        ],
        type: BottomNavigationBarType.fixed, // Fixed type for more than 3 items
        selectedItemColor: Colors.green, // Selected item color
        unselectedItemColor: Colors.grey, // Unselected item color
        backgroundColor: Colors.white, // Background color
      ),
    );
  }

  void _updateIndex(int newIndex) { // Method to update the current index
    setState(() { // Set state to update the UI
      if (newIndex >= 0 && newIndex < 5) { // Check if the new index is within range
        _currentIndex = newIndex; // Update the current index
      }
    });
  }
}
