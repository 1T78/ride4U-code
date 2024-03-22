// ignore_for_file: must_be_immutable // Ignore linting rule for mutability, must_be_immutable

import 'package:flutter/material.dart'; // Import the Flutter Material package
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import the flutter_screenutil package
import '../global_custom_widgets/custom_large_button.dart'; // Import custom large button widget
import '../global_custom_widgets/custom_sized_box.dart'; // Import custom sized box widget
import '../global_custom_widgets/custom_text_form_field.dart'; // Import custom text form field widget
import 'open_google_maps.dart'; // Import open google maps screen

class HomeScreen extends StatefulWidget { // Define a widget for the home screen
  HomeScreen({super.key, this.onSearchPressed, this.currentIndex}); // Constructor for the HomeScreen widget
  final VoidCallback? onSearchPressed; // Callback function for search pressed event
  late int? currentIndex; // Current index for the home screen

  @override
  State<HomeScreen> createState() => _HomeScreenState(); // Create a state for the HomeScreen
}

class _HomeScreenState extends State<HomeScreen> { // Define the state for the HomeScreen
  TextEditingController fromController = TextEditingController(); // Controller for the "from" text field
  TextEditingController toController = TextEditingController(); // Controller for the "to" text field
  String gender = 'any'; // Gender preference
  DateTime selectedDate = DateTime.now(); // Selected date
  TimeOfDay selectedTime = TimeOfDay.now(); // Selected time

  void _openFromBottomSheet() { // Method to open the "from" bottom sheet
    showModalBottomSheet( // Show a modal bottom sheet
      context: context, // Current context
      builder: (BuildContext context) { // Builder function for the bottom sheet
        return Container( // Container widget for the bottom sheet content
          color: Colors.green.shade100, // Background color
          height: 300.h, // Height of the bottom sheet
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w), // Padding for the content
          child: Column( // Column widget for the content
            crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start
            children: <Widget>[ // List of children widgets
              Row( // Row widget for the title
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
              ListTile( // ListTile for choosing location on map
                leading: const Icon(Icons.location_on_outlined), // Leading icon
                title: const Text( // Title text
                  'Choose on map',
                  style: TextStyle(color: Colors.green), // Text style
                ),
                onTap: () { // Callback function when tapped
                  onTapGoogleMaps(context); // Open Google Maps screen
                },
              ),
              Expanded( // Expanded widget for the list view
                child: ListView( // ListView widget for the location list
                  children: const <Widget>[ // List of children widgets
                    ListTile( // ListTile for location
                      title: Text('Islamabad'), // Location name
                      trailing: Text('7.2 km'), // Distance
                    ),
                    ListTile( // ListTile for location
                      title: Text('GT Road'), // Location name
                      trailing: Text('5.3 km'), // Distance
                    ),
                    ListTile( // ListTile for location
                      title: Text('Sahila'), // Location name
                      trailing: Text('7 km'), // Distance
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

  onTapGoogleMaps(BuildContext context) { // Method to handle tap on Google Maps
    Navigator.pushNamed(context, GoogleMapScreen.tag); // Navigate to the Google Maps screen
  }

  Future<void> _selectDate(BuildContext context) async { // Method to select date
    final DateTime? picked = await showDatePicker( // Show date picker dialog
      context: context, // Current context
      initialDate: selectedDate, // Initial selected date
      firstDate: DateTime(2020), // First selectable date
      lastDate: DateTime(2101), // Last selectable date
    );
    if (picked != null && picked != selectedDate) { // Check if date is selected
      setState(() { // Set state to update UI
        selectedDate = picked; // Update selected date
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async { // Method to select time
    final TimeOfDay? picked = await showTimePicker( // Show time picker dialog
      context: context, // Current context
      initialTime: selectedTime, // Initial selected time
    );
    if (picked != null && picked != selectedTime) { // Check if time is selected
      setState(() { // Set state to update UI
        selectedTime = picked; // Update selected time
      });
    }
  }

  void onSearchPressed() { // Method to handle search button pressed
    if (widget.onSearchPressed != null) { // Check if the callback function is not null
      widget.onSearchPressed!(); // Call the callback function
    }
  }

  @override
  Widget build(BuildContext context) { // Build method to create the HomeScreen widget
    return Padding( // Padding widget to add padding around the content
      padding: const EdgeInsets.all(16.0), // Padding for the content
      child: SingleChildScrollView( // SingleChildScrollView to enable scrolling
        child: Column( // Column widget for the content
          crossAxisAlignment: CrossAxisAlignment.stretch, // Align children to the start
          children: <Widget>[ // List of children widgets
            Text( // Text widget for the title
              "Where do you want to go ?", // Title text
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp), // Text style
            ),
            CustomSize( // CustomSize widget for spacing
              height: MediaQuery.of(context).size.height * 0.01.h, // Height of the widget
            ),
            Container( // Container widget for the location selection
              decoration: BoxDecoration( // Box decoration for styling
                  color: Colors.green.shade100, // Background color
                  borderRadius: BorderRadius.circular(10.r)), // Border radius
              child: Padding( // Padding widget for the content
                padding: const EdgeInsets.all(8.0), // Padding for the content
                child: Column( // Column widget for the content
                  crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start
                  children: [ // List of children widgets
                    Padding( // Padding widget for the "from" text field
                      padding: EdgeInsets.all(
                        MediaQuery.of(context).size.height * 0.01.h,
                      ),
                      child: Row( // Row widget for the "from" text field
                        children: [ // List of children widgets
                          Icon( // Icon widget for the "from" text field
                            Icons.location_on_outlined, // Icon for location
                            size: 20.sp, // Icon size
                          ),
                          CustomSize( // CustomSize widget for spacing
                            width: 4.w, // Width of the widget
                          ),
                          Text( // Text widget for the "from" text field
                            "Add location", // Text for the field
                            style: TextStyle( // Text style
                                fontWeight: FontWeight.w600, fontSize: 12.sp), // Font weight and size
                          ),
                        ],
                      ),
                    ),
                    CustomTextField( // CustomTextField widget for the "from" text field
                        suffix: GestureDetector( // GestureDetector for the location icon
                            onTap: _openFromBottomSheet, // Callback function for tap
                            child: const Icon(Icons.location_on_outlined)), // Icon for the field
                        controller: fromController, // Controller for the text field
                        hintText: "From"), // Hint text for the field
                    CustomSize( // CustomSize widget for spacing
                      height: MediaQuery.of(context).size.height * 0.014.h, // Height of the widget
                    ),
                    CustomTextField( // CustomTextField widget for the "to" text field
                        suffix: GestureDetector( // GestureDetector for the location icon
                            onTap: _openFromBottomSheet, // Callback function for tap
                            child: const Icon(Icons.location_on)), // Icon for the field
                        readonly: false, // Make text field editable
                        controller: toController, // Controller for the text field
                        hintText: "To"), // Hint text for the field
                    CustomSize( // CustomSize widget for spacing
                      height: MediaQuery.of(context).size.height * 0.014.h, // Height of the widget
                    ),
                    Row( // Row widget for selecting date
                      children: [ // List of children widgets
                        const Icon(Icons.calendar_month), // Icon for selecting date
                        CustomSize( // CustomSize widget for spacing
                          width: 4.w, // Width of the widget
                        ),
                        const Text("Set Date"), // Text for selecting date
                        CustomSize( // CustomSize widget for spacing
                          width: 4.w, // Width of the widget
                        ),
                        GestureDetector( // GestureDetector for selecting date
                          onTap: () => _selectDate(context), // Callback function for tap
                          child: Container( // Container widget for displaying selected date
                            height: 20, // Height of the container
                            width: 100, // Width of the container
                            decoration: BoxDecoration( // Box decoration for styling
                                border: Border.all(color: Colors.green), // Border color
                                borderRadius: BorderRadius.circular(20.r)), // Border radius
                            child: Center( // Center widget for text
                              child: Text( // Text widget for selected date
                                "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}", // Text content
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    CustomSize( // CustomSize widget for spacing
                      height: MediaQuery.of(context).size.height * 0.014.h, // Height of the widget
                    ),
                    Row( // Row widget for selecting time
                      children: [ // List of children widgets
                        const Icon(Icons.alarm), // Icon for selecting time
                        CustomSize( // CustomSize widget for spacing
                          width: 4.w, // Width of the widget
                        ),
                        const Text("Set Time"), // Text for selecting time
                        CustomSize( // CustomSize widget for spacing
                          width: 4.w, // Width of the widget
                        ),
                        GestureDetector( // GestureDetector for selecting time
                          onTap: () => _selectTime(context), // Callback function for tap
                          child: Container( // Container widget for displaying selected time
                            height: 20, // Height of the container
                            width: 100, // Width of the container
                            decoration: BoxDecoration( // Box decoration for styling
                                border: Border.all(color: Colors.green), // Border color
                                borderRadius: BorderRadius.circular(20.r)), // Border radius
                            child: Center( // Center widget for text
                              child: Text( // Text widget for selected time
                                "${selectedTime.hour}:${selectedTime.minute}", // Text content
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    CustomSize( // CustomSize widget for spacing
                      height: MediaQuery.of(context).size.height * 0.014.h, // Height of the widget
                    ),
                    Text( // Text widget for gender preferences
                      "Gender preferences", // Text content
                      style: TextStyle( // Text style
                          fontWeight: FontWeight.w600, fontSize: 14.sp), // Font weight and size
                    ),
                    Row( // Row widget for selecting male gender
                      children: [ // List of children widgets
                        Radio( // Radio widget for male gender
                          activeColor: Colors.green, // Active color for the radio button
                          value: 'male', // Value for male gender
                          groupValue: gender, // Group value
                          onChanged: (value) { // Callback function when value changes
                            setState(() { // Set state to update UI
                              gender = value.toString(); // Update selected gender
                            });
                          },
                        ),
                        const Text("Male") // Text for male gender
                      ],
                    ),
                    Row( // Row widget for selecting female gender
                      children: [ // List of children widgets
                        Radio( // Radio widget for female gender
                          activeColor: Colors.green, // Active color for the radio button
                          value: 'female', // Value for female gender
                          groupValue: gender, // Group value
                          onChanged: (value) { // Callback function when value changes
                            setState(() { // Set state to update UI
                              gender = value.toString(); // Update selected gender
                            });
                          },
                        ),
                        const Text("Female") // Text for female gender
                      ],
                    ),
                    Row( // Row widget for selecting any gender
                      children: [ // List of children widgets
                        Radio( // Radio widget for any gender
                          activeColor: Colors.green, // Active color for the radio button
                          value: 'any', // Value for any gender
                          groupValue: gender, // Group value
                          onChanged: (value) { // Callback function when value changes
                            setState(() { // Set state to update UI
                              gender = value.toString(); // Update selected gender
                            });
                          },
                        ),
                        const Text("Any") // Text for any gender
                      ],
                    ),
                  ],
                ),
              ),
            ),
            CustomSize( // CustomSize widget for spacing
              height: MediaQuery.of(context).size.height * 0.02.h, // Height of the widget
            ),
            CustomLargeButton(title: "Search", onTap: () { // CustomLargeButton widget for search button
              onSearchPressed(); // Call search pressed event
            })
          ],
        ),
      ),
    );
  }
}
