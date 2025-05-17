import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/AuthControler.dart';
import '../../../../widget/primarybutton.dart';

class Loginform extends StatefulWidget {
  const Loginform({super.key});

  @override
  State<Loginform> createState() => _LoginformState();
}

class _LoginformState extends State<Loginform> {
  final TextEditingController Emailctrl = TextEditingController();
  final TextEditingController passctrl = TextEditingController();
  late AuthController authController;

  @override
  void initState() {
    super.initState();
    authController = Get.put(AuthController());
  }

  @override
  void dispose() {
    Emailctrl.dispose();
    passctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          TextField(
            controller: Emailctrl,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: "Enter your email",
              labelStyle: TextStyle(color: Colors.white),
              prefixIcon: const Icon(Icons.email_outlined, color: Colors.white),
              hintText: "example@mail.com",
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
              fillColor: Theme.of(context).colorScheme.background,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.orange, width: 1),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: passctrl,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Enter your password",
              labelStyle: const TextStyle(color: Colors.white),
              suffixIcon: const Icon(Icons.visibility_off_outlined, color: Colors.white),
              prefixIcon: const Icon(Icons.lock, color: Colors.white),
              hintText: "********",
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
              fillColor: Theme.of(context).colorScheme.background,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.orange, width: 1),
              ),
            ),
          ),
          const SizedBox(height: 40),
          Obx(() => authController.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : Primarybutton(
            icon: Icons.lock_clock_outlined,
            btnNmae: 'LOGIN',
            style: const TextStyle(fontWeight: FontWeight.bold),
            onTap: () {
              authController.login(Emailctrl.text, passctrl.text);
            },
          )),
        ],
      ),
    );
  }
}
