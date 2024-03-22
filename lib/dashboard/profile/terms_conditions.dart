import 'package:flutter/material.dart';
import 'package:ride_4_you/global_custom_widgets/custom_app_bar.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget( // Custom app bar widget with title and back button
        title: "Terms and Conditions", // Title of the app bar
        showBackButton: true, // Show back button on the app bar
      ),
      body: SingleChildScrollView( // SingleChildScrollView to allow scrolling
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20), // Padding for the body content
        child: Column( // Column to arrange the content vertically
          crossAxisAlignment: CrossAxisAlignment.start, // Align content to the start
          children: [
            _buildSectionHeader("User Eligibility:"), // Build section header widget with title
            _buildListItem( // Build list item widget with text
              "Only students and faculty members of Capital University of Science and Technology (CUST) are eligible to use the Ride4U app.",
            ),
            _buildListItem( // Build list item widget with text
              "Users must provide valid CUST student or faculty IDs during registration.",
            ),
            const SizedBox(height: 20), // SizedBox for spacing
            _buildSectionHeader("User Conduct:"), // Build section header widget with title
            _buildListItem( // Build list item widget with text
              "Users agree to provide accurate and truthful information during registration and ride bookings.",
            ),
            _buildListItem( // Build list item widget with text
              "Users are responsible for their conduct while using the app, including interactions with drivers and other users.",
            ),
            const SizedBox(height: 20), // SizedBox for spacing
            _buildSectionHeader("Ride Booking:"), // Build section header widget with title
            _buildListItem( // Build list item widget with text
              "The app facilitates ride-sharing among users, but it does not guarantee the availability or reliability of drivers or rides.",
            ),
            _buildListItem( // Build list item widget with text
              "Users understand that ride availability is subject to factors such as driver availability, vehicle capacity, and scheduling constraints.",
            ),
            const SizedBox(height: 20), // SizedBox for spacing
            _buildSectionHeader("Safety and Security:"), // Build section header widget with title
            _buildListItem( // Build list item widget with text
              "Users agree to abide by all safety regulations and guidelines while using the app, including wearing seatbelts and complying with traffic laws.",
            ),
            _buildListItem( // Build list item widget with text
              "Ride4U is not responsible for any accidents, injuries, or damages that occur during rides booked through the app.",
            ),
            const SizedBox(height: 20), // SizedBox for spacing
            _buildSectionHeader("Payment and Fare Calculation:"), // Build section header widget with title
            _buildListItem( // Build list item widget with text
              "Users agree to pay the fare calculated by the app for the rides they book.",
            ),
            _buildListItem( // Build list item widget with text
              "Fare calculations are based on factors such as distance traveled and any additional services requested by the user.",
            ),
            const SizedBox(height: 20), // SizedBox for spacing
            _buildSectionHeader("Termination of Service:"), // Build section header widget with title
            _buildListItem( // Build list item widget with text
              "Ride4U reserves the right to terminate or suspend user accounts that violate these terms and conditions or engage in fraudulent or illegal activities.",
            ),
            _buildListItem( // Build list item widget with text
              "Users may also choose to deactivate their accounts at any time.",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) { // Function to build section header widget
    return Padding( // Padding for the section header
      padding: const EdgeInsets.only(bottom: 8), // Bottom padding
      child: Text( // Text widget for the section header
        title, // Title text
        style: const TextStyle( // Text style for the section header
          fontSize: 18, // Font size
          fontWeight: FontWeight.bold, // Bold font weight
        ),
      ),
    );
  }

  Widget _buildListItem(String text) { // Function to build list item widget
    return Padding( // Padding for the list item
      padding: const EdgeInsets.only(bottom: 8), // Bottom padding
      child: Text( // Text widget for the list item
        "- $text", // Prefixed with a dash
        style: const TextStyle(fontSize: 16), // Font size
      ),
    );
  }
}
