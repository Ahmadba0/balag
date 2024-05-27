// ignore_for_file: avoid_print, prefer_const_constructors

import 'dart:async';

import 'package:balag/core/services/servises.dart';
import 'package:balag/view/screen/info/infoget.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List sections = [
    {"name": "الشرطة", "img": 'assets/image/Police car-bro.svg'},
    {"name": "البلدية", "img": "assets/image/defendant-rafiki.svg"},
    {"name": "اخرى", "img": 'assets/image/defendant-rafiki.svg'}
  ];

  MyServices myServices = Get.find();

  logout() {
    String userid = myServices.sharedPref.getString("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users${userid}");
    myServices.sharedPref.clear();
    Get.offAll(const InfoGet());
  }

  bool lottie = true;

  @override
  void onInit() {
    print(myServices.sharedPref.getString("id"));

    Timer(Duration(seconds: 2), () {
      lottie = false;
      update();
      print(lottie);
    });

    super.onInit();
  }
}
