// ignore_for_file: must_be_immutable // Ignore linting rule for file, must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ride_4_you/dashboard/open_google_maps.dart';
import 'package:ride_4_you/global_custom_widgets/custom_large_button.dart';
import 'package:ride_4_you/global_custom_widgets/custom_medium_button.dart';
import 'package:ride_4_you/global_custom_widgets/custom_sized_box.dart';
import 'package:ride_4_you/global_custom_widgets/custom_text_form_field.dart';

class DriverHomeScreen extends StatefulWidget {
  DriverHomeScreen({super.key, this.onSearchPressed, this.currentIndex}); // Constructor for DriverHomeScreen widget
  final VoidCallback? onSearchPressed; // Callback function for search button
  late int? currentIndex; // Index for navigation

  @override
  State<DriverHomeScreen> createState() => _DriverHomeScreenState(); // Create state for DriverHomeScreen
}

class _DriverHomeScreenState extends State<DriverHomeScreen> {
  TextEditingController fromController = TextEditingController(); // Controller for from location text field
  TextEditingController toController = TextEditingController(); // Controller for to location text field
  TextEditingController pointController = TextEditingController(); // Controller for pickup point text field

  String gender = 'any'; // Variable to store gender preference
  DateTime selectedDate = DateTime.now(); // Variable to store selected date
  TimeOfDay selectedTime = TimeOfDay.now(); // Variable to store selected time

  void _openFromBottomSheet() { // Function to open bottom sheet for from location selection
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Colors.green.shade100,
          height: 300.h, // Adjust the height as needed
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.green,
                    ),
                  ),
                  CustomSize(
                    width: 6.w,
                  ),
                  const Text("From"),
                ],
              ),
              ListTile(
                leading: const Icon(Icons.location_on_outlined),
                title: const Text(
                  'Choose on map',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  onTapGoogleMaps(context); // Call function to open Google Maps screen
                },
              ),
              Expanded(
                child: ListView(
                  children: const <Widget>[
                    ListTile(
                      title: Text('Islamabad'),
                      trailing: Text('7.2 km'),
                    ),
                    ListTile(
                      title: Text('GT Road'),
                      trailing: Text('5.3 km'),
                    ),
                    ListTile(
                      title: Text('Sahila'),
                      trailing: Text('7 km'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  onTapGoogleMaps(BuildContext context) { // Function to navigate to Google Maps screen
    Navigator.pushNamed(context, GoogleMapScreen.tag);
  }

  Future<void> _selectDate(BuildContext context) async { // Function to select date
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async { // Function to select time
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  void onSearchPressed() { // Function to handle search button tap
    // Check if the callback function is not null
    if (widget.onSearchPressed != null) {
      // Call the callback function
      widget.onSearchPressed!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Where do you want to go ?",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp),
            ),
            CustomSize(
              height: MediaQuery.of(context).size.height * 0.01.h,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(10.r)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(
                        MediaQuery.of(context).size.height * 0.01.h,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 20.sp,
                          ),
                          CustomSize(
                            width: 4.w,
                          ),
                          Text(
                            "Add location",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 12.sp),
                          ),
                        ],
                      ),
                    ),
                    CustomTextField(
                        suffix: GestureDetector(
                            onTap: _openFromBottomSheet,
                            child: const Icon(Icons.location_on_outlined)),
                        controller: fromController,
                        hintText: "From"),
                    CustomSize(
                      height: MediaQuery.of(context).size.height * 0.014.h,
                    ),
                    CustomTextField(
                        suffix: GestureDetector(
                            onTap: _openFromBottomSheet,
                            child: const Icon(Icons.location_on)),
                        readonly: false,
                        controller: toController,
                        hintText: "To"),
                    CustomSize(
                      height: MediaQuery.of(context).size.height * 0.014.h,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.calendar_month),
                        CustomSize(
                          width: 4.w,
                        ),
                        const Text("Set Date"),
                        CustomSize(
                          width: 4.w,
                        ),
                        GestureDetector(
                          onTap: () => _selectDate(context),
                          child: Container(
                            height: 20,
                            width: 100,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.green),
                                borderRadius: BorderRadius.circular(20.r)),
                            child: Center(
                              child: Text(
                                "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    CustomSize(
                      height: MediaQuery.of(context).size.height * 0.014.h,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.alarm),
                        CustomSize(
                          width: 4.w,
                        ),
                        const Text("Set Time"),
                        CustomSize(
                          width: 4.w,
                        ),
                        GestureDetector(
                          onTap: () => _selectTime(context),
                          child: Container(
                            height: 20,
                            width: 100,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.green),
                                borderRadius: BorderRadius.circular(20.r)),
                            child: Center(
                              child: Text(
                                "${selectedTime.hour}:${selectedTime.minute}",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    CustomSize(
                      height: MediaQuery.of(context).size.height * 0.014.h,
                    ),
                    Text(
                      "Gender preferences",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 14.sp),
                    ),
                    Row(
                      children: [
                        Radio(
                          activeColor: Colors.green,
                          value: 'male',
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value.toString();
                            });
                          },
                        ),
                        const Text("Male")
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          activeColor: Colors.green,
                          value: 'female',
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value.toString();
                            });
                          },
                        ),
                        const Text("Female")
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          activeColor: Colors.green,
                          value: 'any',
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value.toString();
                            });
                          },
                        ),
                        const Text("Any")
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.green.shade100),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Add pickup points",
                            style: TextStyle(fontWeight: FontWeight.w800),
                          ),
                          CustomSize(
                            width: 10.w,
                          ),
                          Icon(
                            Icons.add,
                            color: Colors.black,
                            size: 14.sp,
                          ),
                        ],
                      ),
                      CustomSize(
                        height: MediaQuery.of(context).size.height * 0.01.h,
                      ),
                      _pickupPoint(),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).size.height * 0.01.h),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.circle,
                              color: Colors.green,
                              size: 15,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: 50,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: CustomTextField(
                                    readonly: false,
                                    controller: pointController,
                                    hintText: "From"),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Row(
                          children: [
                            const Icon(Icons.alarm),
                            CustomSize(
                              width: 4.w,
                            ),
                            const Text("Set Time"),
                            CustomSize(
                              width: 4.w,
                            ),
                            GestureDetector(
                              onTap: () => _selectTime(context),
                              child: Container(
                                height: 20,
                                width: 100,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green),
                                    borderRadius: BorderRadius.circular(20.r)),
                                child: Center(
                                  child: Text(
                                    "${selectedTime.hour}:${selectedTime.minute}",
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: CustomMediumButton(
                                  title: 'Generate Fare', ontap: () {}),
                            )
                          ],
                        ),
                      ),
                      _pickupPoint(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: CustomLargeButton(
                            title: "Save Add Ride", onTap: () {}),
                      )
                    ],
                  ),
                ),
              ),
            ),
            CustomLargeButton(
                title: "Search",
                onTap: () {
                  onSearchPressed(); // Call function to handle search button tap
                })
          ],
        ),
      ),
    );
  }

  Widget _pickupPoint() { // Widget to display pickup point
    return const Row(
      children: [
        Icon(Icons.add_circle_outline_outlined), // Pickup point icon
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            'Pickup point 1', // Pickup point text
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
