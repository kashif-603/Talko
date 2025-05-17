import 'package:get/get.dart';

import '../pages/Auths/SignIN/AuthMain.dart';

import '../pages/Homepage/Homepage.dart';
import '../pages/chatpage/chatpage.dart';



var PagePath =[
 GetPage(name: "/Signinpage", page: ()=>SignINpage() ,transition: Transition.zoom),
 GetPage(name: "/homepage", page: ()=>Homepage() ,transition: Transition.zoom),
 GetPage(name: "/chatpage", page: ()=>Chatpage() ,transition: Transition.zoom),

];