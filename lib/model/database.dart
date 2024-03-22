// Importing necessary packages
// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart'; // Firestore package for database operations
import 'package:firebase_auth/firebase_auth.dart'; // Firebase Auth package for authentication
import 'package:flutter/material.dart'; // Flutter Material package for UI components
import 'package:fluttertoast/fluttertoast.dart'; // Fluttertoast package for displaying toast messages
import 'package:ride_4_you/authentication/login/login_screen.dart'; // Importing LoginScreen widget
import 'package:ride_4_you/dashboard/dashboard_screen.dart'; // Importing DashboardScreen widget
import 'package:ride_4_you/dashboard/driver/dashboard_driver.dart'; // Importing DriverDashboardScreen widget

// Defining a Database class
class Database {
  final _auth = FirebaseAuth.instance; // Firebase Auth instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance; // Firestore instance

  // Function to sign in user
  void signIn(
    BuildContext context,
    String email,
    String pass,
  ) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(
          color: Colors.green,
        ),
      ),
    );
    try {
      // Signing in with email and password
      await _auth.signInWithEmailAndPassword(email: email, password: pass);
      String role = await getUserRole(); // Getting user role

      // Navigating based on user role
      if (role == 'passenger') {
        Navigator.of(context).popUntil((route) => route.isFirst);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const DashboardScreen()));
            
      } else if (role == 'driver') {
        Navigator.of(context).popUntil((route) => route.isFirst);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const DriverDashboardScreen()));
      }
      Fluttertoast.showToast(msg: "Login Successful"); // Showing login success message
    } catch (e) {
      Fluttertoast.showToast(msg: '$e'); // Showing error message
      Navigator.of(context).pop(); // Dismissing the loading dialog
    }
  }

  // Function to get user role from Firestore
  Future<String> getUserRole() async {
    try {
      User? user = _auth.currentUser; // Getting current user
      if (user != null) {
        // Fetching user data from Firestore
        DocumentSnapshot<Map<String, dynamic>> snapshot =
            await _firestore.collection('allusers').doc(user.uid).get();
        if (snapshot.exists) {
          final data = snapshot.data();
          if (data != null && data.containsKey('role')) {
            return data['role'] as String; // Returning user role
          } else {
            return 'unknown'; // Returning unknown if role field is missing
          }
        } else {
          return 'unknown'; // Returning unknown if document does not exist
        }
      } else {
        return 'unknown'; // Returning unknown if current user is null
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Error fetching user role: $e"); // Showing error message
      return 'unknown'; // Returning unknown in case of error
    }
  }

  // Function to add passenger details to Firestore
  void passengerDetailsToFirestore(
    BuildContext context,
    String username,
    String email,
    String pass,
    String confirmpass,
    String number,
    String fevoritepet,
    String registrationNumber,
    String role,
  ) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(
          color: Colors.green,
        ),
      ),
    );
    try {
      // Creating user with email and password
      await _auth
          .createUserWithEmailAndPassword(email: email, password: pass)
          .then((value) {
        User? user = _auth.currentUser;
        if (user != null) {
          // Adding passenger details to Firestore
          CollectionReference ref =
              FirebaseFirestore.instance.collection('passenger');
          ref.doc(user.uid).set({
            'id': user.uid,
            'Username': username,
            'Email': email,
            'Password': pass,
            'Fevoritepet': fevoritepet,
            'number': number,
            'Registration_No': registrationNumber,
            'Form_Role': role,
            'role': 'passenger',
            'timestamp': FieldValue.serverTimestamp(),
          });

          // Adding user details to allusers collection
          CollectionReference allusersref =
              FirebaseFirestore.instance.collection('allusers');
          allusersref.doc(user.uid).set({
            'id': user.uid,
            'Name': username,
            'Email': email,
            'role': 'passenger',
            'timestamp': FieldValue.serverTimestamp(),
          });

          Fluttertoast.showToast(msg: "Account Created"); // Showing success message
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const LoginScreen())); // Navigating to login screen
        } else {
          Fluttertoast.showToast(msg: "User is null"); // Showing error message
        }
      });
    } catch (e) {
      Fluttertoast.showToast(msg: '$e'); // Showing error message
      Navigator.of(context).pop(); // Dismissing the loading dialog
    }
  }

  // Function to add driver details to Firestore
  void driverDetailsToFirestore(
      BuildContext context,
      String username,
      String email,
      String pass,
      String fevoritepet,
      String vehicleName,
      String number,
      String vehicleType,
      String registration,
      String role) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(
          color: Colors.green,
        ),
      ),
    );
    try {
      // Creating user with email and password
      await _auth
          .createUserWithEmailAndPassword(email: email, password: pass)
          .then((value) {
        User? user = _auth.currentUser;
        if (user != null) {
          // Adding driver details to Firestore
          CollectionReference ref =
              FirebaseFirestore.instance.collection('driver');
          ref.doc(user.uid).set({
            'id': user.uid,
            'Username': username,
            'Email': email,
            'Password': pass,
            'Fevoritepet': fevoritepet,
            'Vehicle Name': vehicleName,
            'Number': number,
            'Vehicle_Type': vehicleType,
            'Registration': registration,
            'University_Role': role,
            'role': 'driver',
            'timestamp': FieldValue.serverTimestamp(),
          });

          // Adding user details to allusers collection
          CollectionReference allusersref =
              FirebaseFirestore.instance.collection('allusers');
          allusersref.doc(user.uid).set({
            'id': user.uid,
            'Name': username,
            'Email': email,
            'role': 'driver',
            'timestamp': FieldValue.serverTimestamp(),
          });

          Fluttertoast.showToast(msg: "Account Created"); // Showing success message
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const LoginScreen())); // Navigating to login screen
        } else {
          Fluttertoast.showToast(msg: "User is null"); // Showing error message
        }
      });
    } catch (e) {
      Fluttertoast.showToast(msg: '$e'); // Showing error message
      Navigator.of(context).pop(); // Dismissing the loading dialog
    }
  }
}
