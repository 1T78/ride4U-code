import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../global_custom_widgets/custom_large_button.dart';
import '../../global_custom_widgets/custom_sized_box.dart';
import 'edit_profile.dart';
import 'general_settings.dart';


class ProfileSettingScreen extends StatelessWidget {
  const ProfileSettingScreen({Key? key}) : super(key: key);
  static const String tag = "ProfileScreen"; // Unique identifier for the profile screen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w), // Set horizontal padding using ScreenUtil
          child: Column(
            children: [
              CustomSize(height: MediaQuery.of(context).size.height*0.16.h), // Custom sized box for spacing
              Padding(
                padding:   EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.06.h), // Set vertical padding using ScreenUtil
                child: CustomLargeButton(
                    title: 'Edit Profile', // Button title
                    onTap: () {
                      onTapEditProfile(context); // Call function to navigate to edit profile screen
                    }
                ),
              ),
              CustomLargeButton(
                title: 'General Settings', // Button title
                onTap: () {
                  onTapGeneralSettings(context); // Call function to navigate to general settings screen
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  onTapGeneralSettings(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const GeneralSettings())); // Navigate to GeneralSettings screen
  } 
  onTapEditProfile(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const EditProfileScreen())); // Navigate to EditProfileScreen screen
  }
}
