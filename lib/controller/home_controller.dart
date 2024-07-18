import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:smartassistant/view/screen/auth/forgetpassword/logout.dart';

import '../core/constant/routes.dart';
import '../core/services/services.dart';
import '../view/screen/camera_view.dart';
import '../view/screen/chat_screen.dart';
import '../view/screen/chatlog.dart';



class HomeController extends GetxController {
  var currentTabIndex = 0.obs;
  MyServices myServices = Get.find();

  final List<Widget> tabPages = [
    const ChatScreen(),
    const ChatLogScreen(),
    const CameraView(),
     LogoutScreen(),
  ];


  void changeTabIndex(int index) {
    currentTabIndex.value = index;
  }

  @override
  logout() async {

    myServices.sharedPreferences.setString("step","1") ;
    await Future.delayed(Duration.zero);
    Get.offNamed(AppRoute.login);
  }
}
