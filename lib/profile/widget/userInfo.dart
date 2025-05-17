import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talko_app/controller/ProfileController.dart';

class Userinfo extends StatefulWidget {
  const Userinfo({super.key});

  @override
  State<Userinfo> createState() => _UserinfoState();
}

class _UserinfoState extends State<Userinfo> {
  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Name and Email (reactive)
          Center(
            child: Obx(() => Column(
              children: [
                Text(
                  profileController.currentUser.value.name ?? "user",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  profileController.currentUser.value.email ?? "Email",
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            )),
          ),

          const SizedBox(height: 29),

          // Buttons Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _actionButton(
                icon: Icons.call,
                label: "Call",
                color: Colors.blue,
                context: context,
              ),
              _actionButton(
                icon: Icons.video_call,
                label: "Video",
                color: Colors.orange,
                context: context,
              ),
              _actionButton(
                icon: Icons.chat_outlined,
                label: "Chat",
                color: Colors.green,
                context: context,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _actionButton({
    required IconData icon,
    required String label,
    required Color color,
    required BuildContext context,
  }) {
    return Container(
      height: 50,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon, color: color),
          const SizedBox(width: 5),
          Text(label, style: TextStyle(color: color)),
        ],
      ),
    );
  }
}
