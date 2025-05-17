import 'package:flutter/material.dart';
import 'package:talko_app/controller/AuthControler.dart';
import 'package:talko_app/profile/Update.dart';
import 'package:talko_app/profile/widget/userInfo.dart';
import 'package:talko_app/widget/primarybutton.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  AuthController authController =AuthController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Profile"),
            InkWell
              (
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>Update()));
                },
                child: Icon(Icons.edit ,color: Colors.orange,))
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(11),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 85,
                              height: 85,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.orange, // Border color
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(
                                    5.0), // Border thickness
                                child: CircleAvatar(
                                  radius: 40,
                                  backgroundImage: AssetImage(
                                    "assets/images/angry-6733037_1280.png",
                                  ),
                                  backgroundColor: Colors.white, // optional
                                ),
                              ),
                            )
                          ],
                        ),
                       SizedBox(height: 16,),

                        Userinfo(),

                      ],
                    ),
                  )
                ],
              ),
            ),
            Spacer(),
           Primarybutton(btnNmae: "LogOuT", icon: Icons.logout, onTap: (){
             authController.logOut();
           })
          ],
        ),
      ),
    );
  }
}
