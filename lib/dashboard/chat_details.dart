import 'package:flutter/material.dart'; // Import the Flutter Material package
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import the flutter_screenutil package for responsive UI

class ChatDetailScreen extends StatelessWidget { // Define a widget for the ChatDetailScreen
  const ChatDetailScreen({Key? key}) : super(key: key); // Constructor for the ChatDetailScreen widget

  @override
  Widget build(BuildContext context) { // Build method to create the ChatDetailScreen widget
    // Initialize ScreenUtil (comment added to explain what's happening here)

    return Scaffold( // Scaffold widget to provide the basic structure of the screen
      appBar: AppBar( // AppBar widget for the app bar at the top of the screen
        title: const Text('Bushra'), // Title of the app bar
      ),
      body: Column( // Column widget to arrange content vertically
        children: <Widget>[ // List of children widgets
          Expanded( // Expanded widget to allow the ListView to occupy remaining space
            child: ListView( // ListView widget to display a list of messages
              padding: EdgeInsets.all(10.h), // Padding around the ListView
              children: <Widget>[ // List of children widgets
                _buildMessage("Please call when reached ", "14:46", true), // Message widget
                _buildMessage("Dont cancel the ride", "14:46", true), // Message widget
                _buildMessage("i have been waiting fo so long", "14:50", false), // Message widget
                // Add more messages here (comment added to indicate where to add more messages)
              ],
            ),
          ),
          _buildInputArea(), // Widget for the input area (comment added for clarity)
        ],
      ),
    );
  }

  Widget _buildMessage(String text, String time, bool isSentByYou) { // Method to build a message widget
    return Align( // Align widget to align the message based on whether it's sent by the user or not
      alignment: isSentByYou ? Alignment.centerRight : Alignment.centerLeft, // Alignment based on sender
      child: Container( // Container widget for the message
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h), // Padding around the message
        margin: EdgeInsets.symmetric(vertical: 5.h), // Margin around the message
        decoration: BoxDecoration( // Decoration for the message container
          color: isSentByYou ? Colors.green.shade200 : Colors.blue.shade100, // Background color based on sender
          borderRadius: BorderRadius.circular(20.r), // Apply border radius
        ),
        child: Column( // Column widget to arrange content vertically
          crossAxisAlignment: CrossAxisAlignment.end, // Align text to the end if sent by the user
          children: <Widget>[ // List of children widgets
            Text(text), // Text widget for the message
            SizedBox(height: 5.h), // SizedBox widget for spacing
            Text(time, style: TextStyle(fontSize: 10.sp)), // Text widget for the message time
          ],
        ),
      ),
    );
  }

  Widget _buildInputArea() { // Method to build the input area widget
    return Align( // Align widget to align the input area at the bottom left
      alignment: Alignment.bottomLeft, // Alignment at the bottom left
      child: Container( // Container widget for the input area
        margin: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 10.h), // Margin around the input area
        padding: EdgeInsets.symmetric(horizontal: 8.w), // Padding inside the input area
        decoration: BoxDecoration( // Decoration for the input area container
          color: Colors.black12, // Background color
          borderRadius: BorderRadius.circular(25.r), // Apply border radius
          border: Border.all(color: Colors.green) // Border color
        ),
        child: SafeArea( // SafeArea widget to ensure content is visible on devices with notches
          child: Row( // Row widget to arrange content horizontally
            children: <Widget>[ // List of children widgets
              IconButton( // IconButton widget for adding attachments
                icon: const Icon(Icons.add, color: Colors.green), // Icon for adding attachments
                onPressed: () {
                  // Implement your add action (comment added to indicate where to add action)
                },
              ),
              const Expanded( // Expanded widget to allow the TextField to occupy remaining space
                child: TextField( // TextField widget for entering text
                  style: TextStyle(color: Colors.black), // Text style
                  decoration: InputDecoration( // Input decoration for the TextField
                    hintText: "How much time?", // Hint text for the TextField
                    hintStyle: TextStyle(color: Colors.green), // Hint text style
                    border: InputBorder.none, // Remove the border
                  ),
                  cursorColor: Colors.black, // Cursor color
                ),
              ),
              IconButton( // IconButton widget for sending messages
                icon: const Icon(Icons.send, color: Colors.green), // Icon for sending messages
                onPressed: () {
                  // Implement your send action (comment added to indicate where to add action)
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
