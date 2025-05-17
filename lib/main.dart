import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:talko_app/pages/AppTheme/ChangeHerre.dart';
import 'package:talko_app/pages/Auths/SignIN/AuthMain.dart';
import 'package:talko_app/pages/Homepage/Homepage.dart';

import 'package:talko_app/pages/SplashScreen/Splash.dart';
import 'package:talko_app/pages/UserProfile/Userprofile.dart';
import 'package:talko_app/pages/chatpage/chatpage.dart';
import 'package:talko_app/pages/welcomepage/welcomePage.dart';
import 'package:talko_app/profile/Update.dart';
import 'package:talko_app/profile/CallingProfilePage.dart';
import 'package:talko_app/profile/widget/userInfo.dart';

import 'config/pagePath.dart';
import 'config/themes/themes.dart';
import 'controller/ProfileController.dart';
import 'firebase_options.dart';
import 'package:talko_app/pages/AppTheme/ChangeMode.dart'; // 👈 Add this for controller

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(ProfileController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Controller controller = Get.put(Controller()); // 👈 Register GetX controller

  @override
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Talko',
      theme: darkTheme,
      darkTheme: ThemeData(

      ),
      getPages: PagePath,

      /// ✅ Dynamically change theme
      themeMode: controller.themeMode,

      home: SplashScreen(), // 👈 You can change this to Splash or WelcomePage if needed
    ));
  }
}
