import 'package:flutter/material.dart'; // Import the Flutter Material package

import 'chat_details.dart'; // Import the chat details screen

class InboxScreen extends StatelessWidget { // Define a widget for the inbox screen
  final List<Map<String, dynamic>> messages = [ // Define a list of messages
    {'name': 'Ali', 'message': 'I am on the way ', 'time': '5:00'}, // Sample message data
    {'name': 'Zahra', 'message': 'Distance?', 'time': '5:30'}, // Sample message data
    {'name': 'Mohsin', 'message': 'I l pay online ', 'time': '6:00'}, // Sample message data
    {'name': 'Ahmed ', 'message': 'Ac is working perfectly ', 'time': '8:00'}, // Sample message data
    {'name': 'Ali Tailor', 'message': 'Come fast', 'time': '9:00'}, // Sample message data
    // Add more messages as needed
  ];

  InboxScreen({Key? key}) : super(key: key); // Constructor for the InboxScreen widget

  @override
  Widget build(BuildContext context) { // Build method to create the InboxScreen widget
    return Scaffold( // Scaffold widget for the screen
      body: ListView.builder( // ListView.builder widget for displaying list of messages
        itemCount: messages.length, // Total number of messages
        itemBuilder: (context, index) { // Item builder function for building each message item
          return ListTile( // ListTile widget for displaying each message
            leading: CircleAvatar( // CircleAvatar widget for displaying user avatar
              backgroundColor: Colors.green.shade100, // Background color of the avatar
              child: const Icon(Icons.person), // Icon for the avatar
            ),
            title: Text(messages[index]['name']), // Title text for the message (sender name)
            subtitle: Text(messages[index]['message']), // Subtitle text for the message (message content)
            trailing: Text(messages[index]['time']), // Trailing text for the message (time)
            onTap: () { // Callback function when the message item is tapped
              Navigator.push( // Navigate to the chat details screen
                context,
                MaterialPageRoute(
                  builder: (context) => const ChatDetailScreen(), // ChatDetailScreen widget
                ),
              );
            },
          );
        },
      ),
    );
  }
}
