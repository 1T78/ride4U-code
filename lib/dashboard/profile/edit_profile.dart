// ignore_for_file: library_private_types_in_public_api

import 'dart:io'; // Import the dart:io library for File operations
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil for responsive UI
import 'package:image_picker/image_picker.dart'; // Import ImagePicker for picking images
import 'package:ride_4_you/global_custom_widgets/custom_app_bar.dart'; // Import CustomAppBarWidget
import 'package:ride_4_you/global_custom_widgets/custom_large_button.dart'; // Import CustomLargeButton widget

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key}); // Constructor for EditProfileScreen

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState(); // Create state for EditProfileScreen
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  File? _imageFile; // Store the picked image file

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(title: "Edit Profile", showBackButton: true), // Custom app bar
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: _pickImage, // Handle image pick on tap
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.grey.shade300,
                backgroundImage: _imageFile != null ? FileImage(_imageFile!) : null, // Show selected image if available
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Muhammad Zain', // User name
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              '8th Semester', // User semester
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 24),
            _buildTextField('Full Name', 'Muhammad Zain', Icons.person), // Text field for full name
            _buildTextField('Email Address', 'zainemail21@gmail.com', Icons.email_outlined), // Text field for email address
            _buildTextField('Phone Number', '+92321433596', Icons.call,), // Text field for phone number
            GestureDetector(
              child: _buildTextField('Password', '****', Icons.lock), // Text field for password
            ),
            CustomLargeButton( // Save button
                title: "Save",
                onTap: () {
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String initialValue, IconData icon) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Column(
        children: [
          TextFormField(
            initialValue: initialValue,
            decoration: InputDecoration(
              prefixIcon: Icon(icon),
              labelText: label,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _pickImage() async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Pick from gallery'),
                onTap: () async {
                  Navigator.pop(context);
                  _pickImageFromSource(ImageSource.gallery); // Pick image from gallery
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Take a picture'),
                onTap: () async {
                  Navigator.pop(context);
                  _pickImageFromSource(ImageSource.camera); // Take a picture from camera
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _pickImageFromSource(ImageSource source) async {
    final XFile? pickedFile = await ImagePicker().pickImage(source: source); // Pick image from specified source

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path); // Set picked image file
      });
    }
  }
}
