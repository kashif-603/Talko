import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:talko_app/Models/userModel.dart';

import '../pages/Auths/SignIN/AuthMain.dart';
import '../pages/Auths/SignIN/widget/LoginForm.dart';

class AuthController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;
  final db = FirebaseFirestore.instance;

  // Login function
  Future<void> login(String email, String password) async {
    isLoading.value = true;
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAllNamed("/homepage");
      Get.snackbar(
        "Login Successful",
        "Welcome back!",
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      if (e.code == "user-not-found") {
        showError("Login Failed", "User not found");
      } else if (e.code == "wrong-password") {
        showError("Login Failed", "Incorrect password");
      } else {
        showError("Login Failed", e.message ?? "Something went wrong");
      }
      return;
    } catch (e) {
      showError("Error", e.toString());
      return;
    }
    isLoading.value = false;
  }

  // Signup/Create User function
  Future<void> createUser(String email, String password ,String name) async {
    isLoading.value = true;
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Get.to(() => SignINpage());
      Get.snackbar(
        "Signup Successful",
        "Account created successfully!",
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
await initUser(email ,name);

    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      if (e.code == "email-already-in-use") {
        showError("Signup Failed", "This email is already in use");
      } else if (e.code == "weak-password") {
        showError("Signup Failed", "Password is too weak");
      } else {
        showError("Signup Failed", e.message ?? "Something went wrong");
      }
      return;
    } catch (e) {
      showError("Error", e.toString());
      return;
    }
    isLoading.value = false;
  }

  void showError(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  Future<void> logOut() async {
    await auth.signOut();
    Get.to(() => SignINpage()); // Replace `LoginPage` with your actual page
  }

  Future<void> initUser(String email ,String name) async {
    var newUser = UserModel(
      email: email,
      name: name,
      id: auth.currentUser!.uid
    );
    try{

      await db
          .collection("users")
          .doc(auth.currentUser!.uid)
          .set(newUser.toJson());
    }catch(e){
      showError("Error", e.toString());
    }
  }
}
