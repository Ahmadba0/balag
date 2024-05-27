// ignore_for_file: prefer_const_constructors, avoid_print, non_constant_identifier_names, file_names

import 'dart:async';

import 'package:balag/core/classes/crud.dart';
import 'package:balag/core/services/servises.dart';
import 'package:balag/linkApi.dart';
import 'package:balag/view/screen/info/infoget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  bool isLoading = false;
  Curd curd = Curd();
  String? phone;
  TextEditingController? password;
  TextEditingController? re_password;
  GlobalKey<FormState> formState = GlobalKey();
  MyServices myServices = Get.find();
  bool isshowpassword = true;
  bool isshowpassword1 = true;

  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  showPassword1() {
    isshowpassword1 = isshowpassword1 == true ? false : true;
    update();
  }

  resetPassword() async {
    /* if (password!.text != re_password!.text) {
      Get.defaultDialog(title: "Warning", middleText: "reEnter the password");
    }*/
    if (formState.currentState!.validate()) {
      if (password!.text == re_password!.text) {
        isLoading = true;
        update;
        var response = await curd.postRequesrt(linkApi.resetpassword, {
          "phone": phone,
          "password": password!.text,
        });
        print(response["status"]);
        if (response["status"] == "success") {
          Get.offAll(() => const InfoGet());
        } else {
          Get.defaultDialog(
              title: "تنبيه", middleText: "هذه هي كلمة السر الحالية");
        }
      } else {
        print("not ==");
        Get.defaultDialog(title: "تنبيه", middleText: "كلمات السر غير متطابقة");
      }
    } else {
      print("not full");
    }
  }

  bool lottie = true;
  @override
  void onInit() {
    phone = Get.arguments['phone'];
    password = TextEditingController();
    re_password = TextEditingController();
    Timer(Duration(milliseconds: 500), () {
      lottie = false;
      update();
      print(lottie);
    });
    super.onInit();
  }
}
