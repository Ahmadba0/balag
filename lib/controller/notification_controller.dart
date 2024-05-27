// ignore_for_file: prefer_const_constructors, avoid_print

import 'dart:async';

import 'package:balag/core/classes/crud.dart';
import 'package:balag/core/services/servises.dart';
import 'package:balag/linkApi.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  List dataNotification = [];
  bool isloading = false;
  Curd crud = Curd();
  MyServices myServices = Get.find();

  getNotification() async {
    print("-----get notify");
    //dataNotification.clear();
    isloading = true;
    update();
    var response = await crud.postRequesrt(linkApi.viewNotification, {
      //'userid': myServices.sharedPref.getString("id")
      'userid': myServices.sharedPref.getString("id").toString()
    });
    isloading = false;
    print(response);
    if (response['status'] == "success") {
      print("------suu");
      dataNotification.addAll(response['data']);
      print("---***---***");
      print(dataNotification[0]['notification_title']);
    }
    update();

    return response;
  }

  bool lottie = true;
  @override
  void onInit() {
    getNotification();
    Timer(Duration(seconds: 1), () {
      lottie = false;
      update();
      print(lottie);
    });
    super.onInit();
  }
}
