// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:ride_4_you/authentication/login/login_screen.dart';
import 'package:ride_4_you/dashboard/profile/terms_conditions.dart';
import 'package:ride_4_you/global_custom_widgets/custom_app_bar.dart';

class GeneralSettings extends StatefulWidget {
  const GeneralSettings({Key? key}) : super(key: key); // Constructor for GeneralSettings widget

  @override
  _GeneralSettingsState createState() => _GeneralSettingsState(); // Create state for GeneralSettings widget
}

class _GeneralSettingsState extends State<GeneralSettings> {
  bool _isNightModeEnabled = false; // Boolean variable to track night mode status

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(
        title: "General settings", // Title of the app bar
        showBackButton: true, // Option to show back button
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            _buildRow("Terms and conditions", Icons.security, () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => const TermsAndConditionsScreen()), // Navigate to TermsAndConditionsScreen
              );
            }, showChevron: true), // Build a row for Terms and Conditions
            _buildNightModeRow(), // Build a row for Night mode
            _buildRow("Delete account", Icons.delete, () {
              // Define onTap function for "Delete account"
            }, iconColor: Colors.red), // Build a row for deleting account
            _buildRow("Log out", Icons.logout, () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const LoginScreen()), // Navigate to LoginScreen
              );
            }), // Build a row for logging out
          ],
        ),
      ),
    );
  }

  Widget _buildNightModeRow() {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              Icon(Icons.nightlight_round), // Night mode icon
              SizedBox(width: 10),
              Text("Night mode"), // Text for Night mode
            ],
          ),
          Switch(
            activeColor: Colors.green, // Active color for switch
            value: _isNightModeEnabled, // Night mode value
            onChanged: (value) {
              setState(() {
                _isNightModeEnabled = value; // Update night mode status
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildRow(String text, IconData icon, VoidCallback onTap,
      {Color? iconColor, bool showChevron = false}) {
    return ListTile(
      onTap: onTap,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: iconColor,
              ),
              const SizedBox(width: 10),
              Text(
                text,
                style: TextStyle(color: iconColor),
              ),
            ],
          ),
          if (showChevron) const Icon(Icons.chevron_right), // Show chevron icon if specified
        ],
      ),
    );
  }
}
