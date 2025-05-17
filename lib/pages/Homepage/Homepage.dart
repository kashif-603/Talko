
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:talko_app/controller/ProfileController.dart';
import 'package:talko_app/pages/Homepage/widget/chatlist.dart';
import '../../config/colors.dart';
import '../../config/strings/appStrings.dart';
import '../../profile/CallingProfilePage.dart';
import '../UserProfile/Userprofile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    ProfileController profileController  = ProfileController();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,// backgroundColor: dBackgroundColor,
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () {},
      ),


      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        titleSpacing: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 13),
          child: Image.asset(
            "assets/icons/communication.png",
            height: 30,
            width: 30,
          ),
        ),
        title: Text(
          AppString.AppName,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
            fontWeight: FontWeight.bold, // 👈 add this line
          ),
        ),


        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>Userprofile()));
          }),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: TabBar(
            controller: tabController,
            indicatorColor: Colors.orange,
            indicatorWeight: 4.0,
            labelColor: Colors.orange,

            unselectedLabelStyle: Theme.of(context).textTheme.labelLarge,
            unselectedLabelColor: Colors.grey.shade600,
            labelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 3,
            ),

            tabs: const [
              Tab(text: "Chat"),
              Tab(text: "Groups"),
              Tab(text: "Calls"),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TabBarView(
          controller: tabController,
          children: [
            Chatlist(),
            ListView(children: [ListTile(title: Text("2"))]),
            ListView(children: [ListTile(title: Text("3"))]),
          ],
        ),
      ),
    );
  }
}
