import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:talko_app/Models/userModel.dart';

class ProfileController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Rx<UserModel> currentUser = UserModel().obs;

  @override
  void onInit() {
    super.onInit();
    getUserDetails(); // Call function when controller initializes
  }

  Future<void> getUserDetails() async {
    try {
      final userId = auth.currentUser?.uid;
      if (userId != null) {
        final doc = await db.collection("users").doc(userId).get();
        if (doc.exists) {
          currentUser.value = UserModel.fromJson(doc.data()!);
        } else {
          print("User document not found");
        }
      } else {
        print("User not logged in");
      }
    } catch (e) {
      print("Error fetching user details: $e");
    }
  }
}
