
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talko_app/pages/chatpage/widget/chatbubble.dart';

import '../../config/colors.dart';

class Chatpage extends StatelessWidget {
  const Chatpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dBackgroundColor,
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.add_call)),
          IconButton(onPressed: (){}, icon: Icon(Icons.video_call))
        ],
        backgroundColor: dContainerColor,
        elevation: 0,
        leading: IconButton( // ✅ GetX ka default back button
          icon: Icon(Icons.arrow_back, color: Colors.white, size: 24),
          onPressed: () => Get.back(),
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey[300], // ✅ Default background
              child: CircleAvatar(
                child: ClipOval(
                  child: Image.asset(
                    "assets/images/angry-6733037_1280.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10), // ✅ Space between image & name
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Abdullah",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Online",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.greenAccent,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      // Using floatingActionButton but managing it properly so it spans full width
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
          child: Container(

            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                Icon(Icons.mic, color: Colors.white),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Type a message",
                      hintStyle: TextStyle(color: Colors.white54),
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      filled: true,
                      fillColor: Colors.white10,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Icon(Icons.image, color: Colors.white),
                SizedBox(width: 10),
                Icon(Icons.send, color: Colors.white),
              ],
            ),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          padding: EdgeInsets.only(bottom: 80), // To provide space for the input bar
          children: [
            SizedBox(height: 20),
            Chatbubble(
                message: 'hello hw r u',
                status: 'read',
                iscomming: true,
                time: '10:10 AM',
                imgUrl: ''),
            Chatbubble(
                message: 'yes... im fine',
                status: 'read',
                iscomming: false,
                time: '10:10 AM',
                imgUrl: ''),
            Chatbubble(
              message: 'bachi check karo',
              status: 'read',
              iscomming: false,
              time: '10:10 AM',
              imgUrl: 'assets/images/girl-4663125_1280.jpg',
            ),
            Chatbubble(
              message: 'yeh chacha check kro',
              status: 'read',
              iscomming: true,
              time: '10:12 AM',
              imgUrl: 'assets/images/men-8922497_1280.jpg',
            ),
          ],
        ),
      ),
    );
  }
}
