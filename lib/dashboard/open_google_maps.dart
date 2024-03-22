// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key}); // Constructor for GoogleMapScreen widget

  static const tag = "OpenGoogleMaps"; // Static tag for identifying the screen

  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState(); // Override createState method
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  late GoogleMapController mapController; // Late initialization of GoogleMapController variable

  final LatLng _center = const LatLng(33.6844, 73.0479); // Example coordinates

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller; // Callback function to initialize mapController when map is created
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold widget for the screen layout
      body: Stack( // Stack widget for overlaying children
        children: [
          GoogleMap( // GoogleMap widget for displaying the map
            onMapCreated: _onMapCreated, // Callback function when map is created
            initialCameraPosition: CameraPosition( // Initial camera position for the map
              target: _center, // Target coordinates
              zoom: 11.0, // Zoom level
            ),
            markers: { // Set of markers to display on the map
              Marker( // Marker widget for adding a marker
                markerId: const MarkerId('someId'), // Unique marker ID
                position: _center, // Marker position
                infoWindow: const InfoWindow(title: 'CUST', snippet: '*'), // InfoWindow for the marker
              ),
              // Add more markers here
            },
          ),
          Positioned( // Positioned widget for positioning a child widget
            bottom: 20, // Distance from the bottom of the screen
            right: 20, // Distance from the right of the screen
            child: ElevatedButton( // ElevatedButton widget for 'Done' button
              child: const Text('Done'), // Button text
              onPressed: () {
                // Handle the 'Done' button tap
              },
            ),
          ),
        ],
      ),
    );
  }
}
