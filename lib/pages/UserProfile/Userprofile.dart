import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:talko_app/widget/primarybutton.dart';

import '../../controller/ProfileController.dart';
import '../../profile/Update.dart';

class Userprofile extends StatefulWidget {
  const Userprofile({super.key});

  @override
  State<Userprofile> createState() => _UserprofileState();
}

class _UserprofileState extends State<Userprofile> {
  final ProfileController controller = Get.put(ProfileController());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  bool isEditing = false;

  @override
  void initState() {
    super.initState();

    // Fill the text fields when user data is loaded
    ever(controller.currentUser, (_) {
      final user = controller.currentUser.value;
      nameController.text = user.name ?? '';
      aboutController.text = user.about ?? '';
      emailController.text = user.email ?? '';
      phoneController.text = user.phoneNumber ?? '';
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    aboutController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("User Profile"),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        actions: [
          IconButton(
            icon: Icon(
              Icons.edit,
              color: isEditing ? Colors.orange : Colors.grey,
            ),
            onPressed: () {
              setState(() {
                isEditing = !isEditing;
              });
            },
          ),
        ],
      ),
      body: Obx(() {
        final user = controller.currentUser.value;

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    // Profile Image Placeholder
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          if (isEditing) {
                            print("Change profile picture tapped");
                            // TODO: Add image picker here
                          }
                        },
                        child: CircleAvatar(
                          backgroundColor: Theme.of(context).colorScheme.background,
                          radius: 50,
                          child: const Icon(Icons.camera_alt_outlined, size: 30),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Name Field
                    TextField(
                      controller: nameController,
                      enabled: isEditing,
                      decoration: _inputDecoration("Name", Icons.person),
                    ),
                    const SizedBox(height: 10),

                    // About Field
                    TextField(
                      controller: aboutController,
                      enabled: isEditing,
                      decoration: _inputDecoration("About", Icons.info_outline),
                    ),
                    const SizedBox(height: 10),

                    // Email (non-editable)
                    TextField(
                      controller: emailController,
                      enabled: false,
                      decoration: _inputDecoration("Email", Icons.mail),
                    ),
                    const SizedBox(height: 10),

                    // Phone
                    TextField(
                      controller: phoneController,
                      enabled: isEditing,
                      decoration: _inputDecoration("Phone", Icons.phone_android),
                    ),
                    const SizedBox(height: 20),

                    if (isEditing)
                      Primarybutton(
                        btnNmae: "Save",
                        icon: Icons.save,
                        onTap: () async {
                          if (nameController.text.trim().isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Name cannot be empty")),
                            );
                            return;
                          }


                          setState(() {
                            isEditing = false;
                          });

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Profile updated successfully")),
                          );
                        },
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  InputDecoration _inputDecoration(String hint, IconData icon) {
    return InputDecoration(
      hintText: hint,
      prefixIcon: Icon(icon),
      border: InputBorder.none,
      filled: true,
      fillColor: Theme.of(context).colorScheme.background,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    );
  }
}
