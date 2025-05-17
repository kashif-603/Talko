import 'package:flutter/material.dart';

import '../../../config/strings/appStrings.dart';

class WelcomeBody extends StatelessWidget {
  const WelcomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return    Column(
      children: [
        Text(WelcomePageCustom.nowyouare ,style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 30),),
        Text(WelcomePageCustom.connected ,style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 30 ,color: Colors.orange),),
        SizedBox(height: 50,),
        Text(
          textAlign: TextAlign.center,
          WelcomePageCustom.des ,style: Theme.of(context).textTheme.labelLarge,)

      ],
    );
  }
}
