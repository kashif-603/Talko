
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:slide_to_act/slide_to_act.dart';


import '../../../config/strings/appStrings.dart';

class Slidetoact extends StatefulWidget {
  const Slidetoact({super.key});

  @override
  State<Slidetoact> createState() => _SlidetoactState();
}

class _SlidetoactState extends State<Slidetoact> {
  @override
  Widget build(BuildContext context) {
    return  Align(
        alignment: Alignment.center,
        child: SlideAction(
          onSubmit: () {
            Get.offAllNamed("/Signinpage");
            return null;
          },
          sliderButtonIcon: const Icon(Icons.call, color: Colors.white), //  Corrected icon
          innerColor: Colors.orange,
          // Button color
          outerColor: Theme.of(context).colorScheme.primaryContainer, //  Background color
          elevation: 5, //  Shadow effect
          borderRadius: 50, //  Smooth rounded corners
          text: WelcomePageCustom.slidetosart, textStyle: Theme.of(context).textTheme.labelLarge, //  Custom text

          sliderRotate: true, //  Stops icon rotation
          height: 70, //  Adjusted height
          //  Adjusted width
        )

    );
  }
}
