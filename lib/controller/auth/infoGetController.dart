// ignore_for_file: unused_local_variable, avoid_print, prefer_const_constructors, prefer_typing_uninitialized_variables, file_names

import 'dart:async';

import 'package:balag/core/classes/crud.dart';
import 'package:balag/core/services/servises.dart';
import 'package:balag/linkApi.dart';
import 'package:balag/view/screen/home.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoGetController extends GetxController {
  TextEditingController? number;
  TextEditingController? password;
  Curd curd = Curd();
  GlobalKey<FormState> formState = GlobalKey();
  bool isloadinginfoget = false;
  MyServices myServices = Get.find();
  List datauser = [];
  var userid;
  bool isshowpassword = true;

  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  getInfo() async {
    //datauser.clear();isloadinginfoget = true;
    update();
    if (formState.currentState!.validate()) {
      var response = await curd.postRequesrt(linkApi.infoGet, {
        "number": number!.text,
        "password": password!.text,
      });
      isloadinginfoget = false;
      update();
      if (response['status'] == 'success') {
        //datauser.addAll(response['data']);
        print(response['data']);
        if (response['data']['users_number'] != null) {
          myServices.sharedPref
              .setString("id", response['data']['users_id'].toString());
          myServices.sharedPref
              .setString("name", response['data']['users_name'].toString());
          myServices.sharedPref
              .setString("number", response['data']['users_number'].toString());
          myServices.sharedPref
              .setString("phone", response['data']['users_phone'].toString());

          userid = myServices.sharedPref.getString("id")!;
          print("------------");
          print(userid);

          FirebaseMessaging.instance.subscribeToTopic("users");
          FirebaseMessaging.instance.subscribeToTopic("users${userid}");
          print(myServices.sharedPref.getString("id"));
          print("******************");
          print(response);
          myServices.sharedPref.setString("step", "4");
          Get.to(
            Home(),
          );
        } else {
          Get.snackbar(
              "error", "there are some error pleas try sure your info");
        }
      } else {
        Get.snackbar("تنبيه", "يرجى التأكد من إدخال المعلومات");
      }
    }
  }

  bool lottie = true;
  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print("--value token : $value");
      String? token = value;
    });

    number = TextEditingController();
    password = TextEditingController();
    Timer(Duration(milliseconds: 500), () {
      lottie = false;
      update();
      print(lottie);
    });

    super.onInit();
  }
}
