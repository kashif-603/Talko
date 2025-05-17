import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:talko_app/widget/primarybutton.dart';

import '../pages/AppTheme/ChangeHerre.dart';
import '../pages/AppTheme/ChangeMode.dart';

class Update extends StatelessWidget {
  Update({super.key});

  // ✅ TextEditingControllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  Controller controller = Get.put(Controller());
  final Color color = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("Update Profile"),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Obx(() => Switch(
                  value: controller.isDarkTheme.value,
                  onChanged: (s) {
                    controller.ChangeTheme();
                  },
                )),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  // 🔵 Circular profile icon
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      shape: BoxShape.circle,
                    ),
                    width: 150,
                    height: 150,
                    child: const Center(
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.grey,
                        size: 40,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Personal Details",
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // 🔤 TextFields with controller
                  _buildTextField(
                    context,
                    hintText: "Kashif",
                    iconData: Icons.person,
                    controller: nameController,
                  ),
                  _buildTextField(
                    context,
                    hintText: "Talko123@gmail.com",
                    iconData: Icons.mail,
                    controller: emailController,
                  ),
                  _buildTextField(
                    context,
                    hintText: "03200000000",
                    iconData: Icons.call,
                    controller: phoneController,
                  ),

                  const SizedBox(height: 20),
                  Primarybutton(
                      btnNmae: "Save",

                      icon: Icons.save_alt,
                      onTap: () {})
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔧 Custom TextField widget
  Widget _buildTextField(
    BuildContext context, {
    required String hintText,
    required IconData iconData,
    required TextEditingController controller,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextField(
          controller: controller,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(iconData, color: color),
            hintStyle: TextStyle(color: Colors.grey[600]),
            border: OutlineInputBorder(borderSide: BorderSide.none),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
        ),
      ),
    );
  }
}
