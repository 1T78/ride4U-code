import 'package:flutter/material.dart'; // Import the material package for Flutter UI components
import 'package:flutter/services.dart'; // Import services package for system-related functionalities
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import screenutil package for responsive UI

class CustomAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String? title; // Declare a nullable string variable to hold the title of the app bar
  final IconData? icon; // Declare a nullable IconData variable to hold the icon of the app bar
  final bool showBackButton; // Declare a boolean variable to indicate whether to show the back button
  final bool showDrawerButton; // Declare a boolean variable to indicate whether to show the drawer button

  const CustomAppBarWidget({
    this.title, // Initialize title with null
    this.icon, // Initialize icon with null
    this.showBackButton = false, // Initialize showBackButton with default value false
    this.showDrawerButton = false, // Initialize showDrawerButton with default value false
    super.key, // Call the super constructor with key parameter
  });

  @override
  Size get preferredSize => Size.fromHeight(50.h); // Define the preferred size of the app bar

  @override
  Widget build(BuildContext context) { // Build method to create the app bar widget
    return AppBar(
      centerTitle: true, // Center align the title
      backgroundColor: Colors.transparent, // Make the app bar background transparent
      automaticallyImplyLeading: false, // Disable the automatic leading icon
      systemOverlayStyle: const SystemUiOverlayStyle( // Define system overlay style for status bar and navigation bar
        systemNavigationBarIconBrightness: Brightness.light, // Set navigation bar icon brightness to light
        systemNavigationBarColor: Colors.white, // Set navigation bar color to white
        statusBarColor: Colors.transparent, // Set status bar color to transparent
        statusBarBrightness: Brightness.light, // Set status bar brightness to light
        statusBarIconBrightness: Brightness.dark, // Set status bar icon brightness to dark
      ),
      leading: showDrawerButton // Check if the drawer button should be shown
          ? IconButton(
        icon: const Icon(Icons.menu, color: Colors.black), // Drawer icon
        onPressed: () {
          Scaffold.of(context).openDrawer(); // Open drawer when button is pressed
        },
      )
          : showBackButton // Check if the back button should be shown
          ? IconButton(
        icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black), // Back icon
        onPressed: () {
          FocusScope.of(context).unfocus(); // Unfocus any focused widget
          Navigator.pop(context); // Pop the current route from the navigation stack
        },
      )
          : null, // If neither back nor drawer button is shown, leading should be null
      title: Text(title ?? ""), // Display the title text
      actions: icon != null ? [Icon(icon)] : null, // Display actions if icon is provided
    );
  }
}
