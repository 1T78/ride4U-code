// Importing necessary packages
import 'package:firebase_core/firebase_core.dart'; // Firebase Core package for initializing Firebase
import 'package:flutter/material.dart'; // Flutter Material package for UI components
import 'myApp.dart'; // Importing your custom MyApp widget

// Main function, entry point of the application
void main() async {
  // Ensure that Flutter widgets are initialized
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase, this is an asynchronous operation so we use 'async' keyword
  await Firebase.initializeApp();
  
  // Run the Flutter application, passing your custom MyApp widget as the root widget
  runApp(const MyApp());
}
