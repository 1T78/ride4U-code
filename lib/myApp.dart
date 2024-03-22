// Ignoring lint rule for file names
// Importing necessary packages
// ignore_for_file: file_names

import 'package:flutter/material.dart'; // Flutter Material package for UI components
import 'package:flutter/services.dart'; // Flutter services package for system interactions
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Flutter Screen Util package for responsive design
import 'package:ride_4_you/dashboard/driver/accept_reject_ride.dart'; // Importing accept_reject_ride.dart file
import 'package:ride_4_you/dashboard/dashboard_screen.dart'; // Importing dashboard_screen.dart file
import 'package:ride_4_you/dashboard/request_ride.dart'; // Importing request_ride.dart file
import 'package:ride_4_you/end_ride.dart'; // Importing end_ride.dart file
import 'package:ride_4_you/authentication/signup/signup_passenger.dart'; // Importing signup_passenger.dart file
import 'package:ride_4_you/splash_screen.dart'; // Importing splash_screen.dart file
import 'dashboard/open_google_maps.dart'; // Importing open_google_maps.dart file
import 'dashboard/ride_request_details.dart'; // Importing ride_request_details.dart file
import 'authentication/forgot_password/forgot_password.dart'; // Importing forgot_password.dart file
import 'get_started_signup.dart'; // Importing get_started_signup.dart file
import 'authentication/signup/signup_driver.dart'; // Importing signup_driver.dart file
import 'authentication/login/login_screen.dart'; // Importing login_screen.dart file
import 'package:ride_4_you/dashboard/ongoing_ride_screen.dart'; // Importing ongoing_ride_screen.dart file

// Defining the main app class
class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Constructor for MyApp widget

  // Function to get the initial route of the app
  String getInitialRoute() {
    return SplashScreen.tag; // Returning SplashScreen as the initial route
  }

  // Building the app UI
  @override
  Widget build(BuildContext context) {
    // Setting preferred device orientation to portrait up
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    // Initializing ScreenUtil for responsive design
    return ScreenUtilInit(
        designSize: const Size(360, 690), // Setting design size for responsive design
        builder: (_, child) {
          // Building MaterialApp widget
          return MaterialApp(
            debugShowCheckedModeBanner: false, // Disabling debug banner
            title: 'My Diary App', // Setting app title
            initialRoute: getInitialRoute(), // Setting initial route
            onGenerateRoute: _generateRoute, // Generating routes
          );
        });
  }
}

// Function to generate routes based on route settings
Route _generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.tag:
      return _createRightToLeftRoute(const SplashScreen(), settings); // Creating route for SplashScreen

    case LoginScreen.tag:
      return _createRightToLeftRoute(const LoginScreen(), settings); // Creating route for LoginScreen
    case GetStartSignUp.tag:
      return _createRightToLeftRoute(const GetStartSignUp(), settings); // Creating route for GetStartSignUp
    case SignUpPassenger.tag:
      return _createRightToLeftRoute(const SignUpPassenger(), settings); // Creating route for SignUpPassenger
    case SignUpDriver.tag:
      return _createRightToLeftRoute(const SignUpDriver(), settings); // Creating route for SignUpDriver
    case ForgotPassword.tag:
      return _createRightToLeftRoute(const ForgotPassword(), settings); // Creating route for ForgotPassword
    case DashboardScreen.tag:
      return _createRightToLeftRoute(const DashboardScreen(), settings); // Creating route for DashboardScreen
    case GoogleMapScreen.tag:
      return _createRightToLeftRoute(const GoogleMapScreen(), settings); // Creating route for GoogleMapScreen
    case RideRequestDetails.tag:
      return _createRightToLeftRoute(const RideRequestDetails(), settings); // Creating route for RideRequestDetails
    case RideRequest.tag:
      return _createRightToLeftRoute(const RideRequest(), settings); // Creating route for RideRequest
    case AcceptRejectRide.tag:
      return _createRightToLeftRoute(const AcceptRejectRide(), settings); // Creating route for AcceptRejectRide
    case EndRide.tag:
      return _createRightToLeftRoute(const EndRide(), settings); // Creating route for EndRide
    case OnGoingRide.tag:
      return _createRightToLeftRoute(OnGoingRide(), settings); // Creating route for OnGoingRide

    // Add other routes here
    default:
      return _createRightToLeftRoute(const SplashScreen(), settings); // Default route is SplashScreen
  }
}

// Function to create a right-to-left transition route
PageRoute _createRightToLeftRoute(Widget page, RouteSettings settings) {
  return PageRouteBuilder(
    settings: settings,
    pageBuilder: (context, animation, secondaryAnimation) => page, // Building page
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = const Offset(1.0, 0.0); // Starting offset
      var end = Offset.zero; // Ending offset
      var curve = Curves.easeInOut; // Transition curve
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve)); // Tween animation
      var offsetAnimation = animation.drive(tween); // Applying animation

      // Creating a slide transition
      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}
