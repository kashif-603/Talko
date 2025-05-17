// import 'package:chat_app/pages/Auths/SignIN/widget/Authbody.dart';
// import 'package:chat_app/pages/welcomepage/widget/welcomeHeading.dart';
import 'package:flutter/material.dart';
import 'package:talko_app/pages/Auths/SignIN/widget/Authbody.dart';

import '../../../config/colors.dart';
import '../../welcomepage/widget/welcomeHeading.dart';

class SignINpage extends StatelessWidget {
  const SignINpage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: dBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min, 
              children: [
                SizedBox(height: 20),
                Welcomeheading(),
                SizedBox(height: 40),
                Authbody(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
