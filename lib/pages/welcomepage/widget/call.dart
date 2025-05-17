import 'package:flutter/material.dart';

class Call extends StatelessWidget {
  const Call({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Row(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.orange, // Background color
            child: Padding(
              padding: EdgeInsets.all(3), // Adjust padding to show background
              child: ClipOval(
                child: Image.asset(
                  "assets/images/angry-6733037_1280.png",
                  height: 120, // Adjusted size
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Icon(Icons.wifi_calling_3),
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.orange, // Background color for second avatar
            child: Padding(
              padding: EdgeInsets.all(3), // Adjust padding to show background
              child: ClipOval(
                child: Image.asset(
                  "assets/images/phone-call-6707001_1280.png",
                  height: 120, // Adjusted size
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
