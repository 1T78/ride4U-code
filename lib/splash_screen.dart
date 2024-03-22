// Importing necessary packages
import 'package:flutter/material.dart'; // Flutter Material package for UI components
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Flutter Screen Util package for responsive design
import 'authentication/login/login_screen.dart'; // Importing login_screen.dart file

// Defining SplashScreen as a StatefulWidget
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key}); // Constructor for SplashScreen widget
  static const String tag = '/SplashScreen'; // Static constant for the route tag

  @override
  State<SplashScreen> createState() => _SplashScreenState(); // Creating state for SplashScreen
}

// State class for SplashScreen
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Delaying navigation to the login screen by 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      // Navigating to the LoginScreen using the route name
      Navigator.popAndPushNamed(context, LoginScreen.tag);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Building the UI for SplashScreen
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(12.h), // Setting padding using ScreenUtil
          child: Image.asset(
            "assets/logo-removebg-preview.png", // Image asset path
            color: Colors.green, // Applying green color to the image
          ),
        ),
      ),
    );
  }
}
