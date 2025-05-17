import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'chatTile.dart';

class Chatlist extends StatelessWidget {
  const Chatlist({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: ListView(
        children: [
          InkWell(
            onTap: () {
              Get.toNamed('/chatpage');
            },
            child: Chattile(
              img: 'assets/images/angry-6733037_1280.png',
              title: 'Abdullah',
              subtitle: 'Theek hai',
              time: '8:00 PM',
            ),
          ),
          Divider(),
          Chattile(
            img: 'assets/images/girl-4663125_1280.jpg',
            title: 'Sana',
            subtitle: 'Miss you',
            time: '9:00 PM',
          ),
          Divider(),
          Chattile(
            img: 'assets/images/girl-6614415_1280.jpg',
            title: 'Maria',
            subtitle: 'How are you?😊',
            time: '9:00 PM',
          ),
          Divider(),
          Chattile(
            img: 'assets/images/man-1845814_1280.jpg',
            title: 'Salar',
            subtitle: 'Kia ho rha hai',
            time: '9:00 PM',
          ),
          Divider(),
          Chattile(
            img: 'assets/images/men-8826710_1280.jpg',
            title: 'Huxaifa',
            subtitle: 'Acha g',
            time: '9:00 PM',
          ),
          Divider(),
          Chattile(
            img: 'assets/images/men-8922497_1280.jpg',
            title: 'Amir',
            subtitle: 'Love to see you ❤️',
            time: '9:00 PM',
          ),
          Divider(),
          Chattile(
            img: 'assets/images/angry-6733037_1280.png',
            title: 'Abdullah',
            subtitle: 'Theek hai',
            time: '8:00 PM',
          ),
          Divider(),
          Chattile(
            img: 'assets/images/girl-4663125_1280.jpg',
            title: 'Sana',
            subtitle: 'Miss you',
            time: '9:00 PM',
          ),
        ],
      ),
    );
  }
}
