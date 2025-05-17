import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../controller/AuthControler.dart';
import '../../../../widget/primarybutton.dart';

class SignUpform extends StatefulWidget {
  const SignUpform({super.key});

  @override
  State<SignUpform> createState() => _SignUpformState();
}

class _SignUpformState extends State<SignUpform> {
  TextEditingController namelctrl =TextEditingController();
  TextEditingController Emailctrl =TextEditingController();
  TextEditingController passctrl =TextEditingController();
  AuthController authController=Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const SizedBox(height: 30),
           // Space between text and TextField
          TextField(controller: namelctrl,
            keyboardType: TextInputType.name, // Password input type
             //  Hide password input
            decoration: InputDecoration(
              labelText: "Enter your Name", //  Label text
              labelStyle: const TextStyle(color: Colors.white),
              prefixIcon: Icon(Icons.person_2_outlined),//
              hintText: "Kashif", //
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)), //
              fillColor: Theme.of(context).colorScheme.background,
              filled: true, //
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20), //
                borderSide: BorderSide.none, // r
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20), //
              // enabledBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(30),
              //   borderSide: BorderSide(color: Colors.orange, width: 1), // Orange border
              // ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.orange, width: 1), //
              ),

            ),
          ),
          const SizedBox(height: 16),// Space between text and TextField
          TextField(
            controller: Emailctrl,
            keyboardType: TextInputType.emailAddress, // Email input type
            decoration: InputDecoration(
              labelText: "Enter your email",
              labelStyle: TextStyle(color: Colors.white),
              prefixIcon: const Icon(Icons.email_outlined, color: Colors.white), // Email icon
              hintText: "example@mail.com", // Placeholder text
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)), // Hint text color
              fillColor: Theme.of(context).colorScheme.background, // Background color
              filled: true, // Apply background color
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20), // Rounded corners
                borderSide: BorderSide.none, // No default border
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20), // Padding inside
              // enabledBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(30),
              //   borderSide: BorderSide(color: Colors.orange, width: 1), // Orange border
              // ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.orange, width: 1), // White border on focus
              ),
            ),
          ),
          const SizedBox(height: 15), // Space between text and TextField
          TextField(
            controller: passctrl,
            keyboardType: TextInputType.visiblePassword, // Password input type
            obscureText: true, //  Hide password input
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock ,color: Colors.white,),
              labelText: "Enter your password", //  Label text
              labelStyle: const TextStyle(color: Colors.white), //
              suffixIcon: const Icon(Icons.visibility_off_outlined, color: Colors.white), //
              hintText: "********", //
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)), //
              fillColor: Theme.of(context).colorScheme.background,
              filled: true, //
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20), //
                borderSide: BorderSide.none, // r
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20), //
              // enabledBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(30),
              //   borderSide: BorderSide(color: Colors.orange, width: 1), // Orange border
              // ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.orange, width: 1), //
              ),

            ),
          ),
          SizedBox(height: 20,),
         Obx(()
         =>
         authController.isLoading.value?Center(child: CircularProgressIndicator(),):
    Primarybutton(icon: Icons.lock_clock_outlined, btnNmae: 'SIGNUP', onTap: () {
      authController.createUser(Emailctrl.text, passctrl.text ,namelctrl.text);


    },))

        ],
      ),
    );

  }
}
