
import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:talko_app/pages/welcomepage/widget/SlideToAct.dart';
import 'package:talko_app/pages/welcomepage/widget/bodyofwc.dart';
import 'package:talko_app/pages/welcomepage/widget/call.dart';
import 'package:talko_app/pages/welcomepage/widget/welcomeHeading.dart';

import '../../config/colors.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: dBackgroundColor,
        body: SingleChildScrollView(
          // ✅ Scrolling enabled
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Welcomeheading(),
                const SizedBox(height: 40),
                Call(),
                const SizedBox(height: 30),
                WelcomeBody(),
                const SizedBox(height: 50),
                Slidetoact(),
                const SizedBox(height: 20), // Space at bottom
              ],
            ),
          ),
        ),
      ),
    );
  }
}
