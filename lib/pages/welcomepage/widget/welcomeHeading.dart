import 'package:flutter/material.dart';

import '../../../config/strings/appStrings.dart';

class Welcomeheading extends StatelessWidget {
  const Welcomeheading({super.key});

  @override
  Widget build(BuildContext context) {
    return

      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.transparent,
            child: ClipOval(
              child: Image.asset(
                "assets/icons/communication.png",
                width: 150,
                height: 150,
                fit: BoxFit.cover, // Ensures image fills the circle properly
              ),
            ),
          ),
          SizedBox(height: 10,),
          Text(AppString.AppName ,style: Theme.of(context).textTheme.headlineLarge?.copyWith(letterSpacing: 6 ,color: Colors.orange)
            ,)

        ],)],);

  }
}
