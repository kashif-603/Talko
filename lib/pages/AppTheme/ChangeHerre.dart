import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talko_app/pages/AppTheme/ChangeMode.dart';

class Changeherre extends StatelessWidget {
  const Changeherre({super.key});

  @override
  Widget build(BuildContext context) {
    Controller controller = Get.put(Controller());

    return Scaffold(

      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            /// 🔁 Wrap Switch inside Obx() to react to theme change
            Obx(() => Switch(
              value: controller.isDarkTheme.value,
              onChanged: (s) {
                controller.ChangeTheme();
              },
            )),
          ],
        ),
      ),
    );
  }
}
